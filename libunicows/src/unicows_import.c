
#include <windows.h>
#include "unicows_import.h"

/* ------------------------------------------------------------------------ *
 * Avoid using CRT, reimplement needed parts ourselves:                     *
 * ------------------------------------------------------------------------ */

static void my_strcat(char *dst, const char *src)
{
	char *cd;
	const char *cs;

	for (cd = dst; *cd; cd++) {}
	for (cs = src; *cs; ) *(cd++) = *(cs++);
	*cd = 0;
}


/* ------------------------------------------------------------------------ *
 * Error handling:                                                          *
 * ------------------------------------------------------------------------ */

void UnicowsReportFatalError(const char *msg)
{
    char buffer[4096];
	buffer[0] = 0;
    my_strcat(buffer, msg);
	my_strcat(buffer, "\nThe application will terminate now.");

    MessageBoxA(NULL, buffer, "Fatal error", MB_ICONSTOP);
    ExitProcess(1);
}


/* ------------------------------------------------------------------------ *
 * Standard implementations:                                                *
 * ------------------------------------------------------------------------ */

static HMODULE __stdcall StdLoadUnicows(void)
{
    return LoadLibraryA(UnicowsDllName);
}

static void __stdcall StdImportError(const char *dll, const char *symbol)
{
    char buffer[4096];
	buffer[0] = 0;

    if (symbol)
	{
		my_strcat(buffer, "Error while importing symbol '");
		my_strcat(buffer, symbol);
		my_strcat(buffer, "' from DLL '");
		my_strcat(buffer, dll);
	}
    else
	{
        my_strcat(buffer, "Error while loading DLL '");
		my_strcat(buffer, dll);
	}
	my_strcat(buffer, "'!");
    UnicowsReportFatalError(buffer);
}


/* ------------------------------------------------------------------------ *
 * ...and the hooks:                                                        *
 * ------------------------------------------------------------------------ */

HMODULE (__stdcall *_PfnLoadUnicows)(void) = StdLoadUnicows;
const char *UnicowsDllName = "unicows.dll";
void (__stdcall *UnicowsImportError)(const char *, const char *) = StdImportError;


/* ------------------------------------------------------------------------ *
 * GetProcAddress implementation:                                           *
 * ------------------------------------------------------------------------ */

/* NB: unicows.dll implements GetProcAddress, too, but since we need to use
       the *real* GetProcAddress from kernel32.dll, we must load it
       ourselves. And we can't use GetProcAddress for that because it's 
       libunicows stub and not initialized at the time we need it. Therefore
       a hack is done here: we use own reimplementation of GetProcAddress to
       load the symbol from kernel32.dll and use this dynamically loaded
       GetProcAddress from that point on to load all symbols. */

static HMODULE dllHandleKernel32 = 0;
static FARPROC WINAPI (*ptrGetProcAddress)(HINSTANCE,LPCSTR) = 0;
    
/* DMC doesn't have UINT_PTR: */
#ifdef __DMC__
    #ifdef _WIN64
        typedef unsigned __int64 UINT_PTR;
    #else
        typedef unsigned int UINT_PTR;
    #endif
#endif

/* GetProcAddress reimplementation
   (code by Alexey A. Popoff <pvax@mail.ru>): */

static FARPROC InternalGetProcAddress(HMODULE hModule,
                                      const char *szProcName)
{
    /* Helper macro - RVA to pointer */
    #define PTR(baseAdr, RVA) ((UINT_PTR)(baseAdr) + (UINT_PTR)(RVA))

    /* No error checking, no address by ordinal: use only for
       the workaround's needs! */
    unsigned i;
    PIMAGE_DOS_HEADER pDosHeader;
    PIMAGE_NT_HEADERS pNTHeaders;
    PIMAGE_DATA_DIRECTORY pDataDir;
    PIMAGE_EXPORT_DIRECTORY pExportDir;
    WORD* prvaOrdinals;
    DWORD* prvaNames;
    DWORD* prvaFuncs;

    pDosHeader = (PIMAGE_DOS_HEADER)hModule;
    pNTHeaders = (PIMAGE_NT_HEADERS)PTR(hModule, pDosHeader->e_lfanew);

    pDataDir = &(pNTHeaders->OptionalHeader.DataDirectory[
                                    IMAGE_DIRECTORY_ENTRY_EXPORT]);
    pExportDir = (PIMAGE_EXPORT_DIRECTORY)PTR(hModule,
                                              pDataDir->VirtualAddress);
    prvaOrdinals = (WORD*)PTR(hModule, pExportDir->AddressOfNameOrdinals);
    prvaNames = (DWORD*)PTR(hModule, pExportDir->AddressOfNames);
    prvaFuncs = (DWORD*)PTR(hModule, pExportDir->AddressOfFunctions);

    for (i = 0; i < pExportDir->NumberOfNames; i++)
    {
        if (0 == lstrcmpA((LPCSTR)PTR(hModule, prvaNames[i]), szProcName))
            return (FARPROC)PTR(hModule, prvaFuncs[prvaOrdinals[i]]);
    }

    return NULL;
}

static void LoadGetProcAddress()
{
    dllHandleKernel32 = LoadLibraryA("kernel32.dll");
    if (!dllHandleKernel32)
        UnicowsImportError("kernel32.dll", NULL);
    ptrGetProcAddress = (FARPROC WINAPI (*)(HINSTANCE,LPCSTR))
        InternalGetProcAddress(dllHandleKernel32, "GetProcAddress");
    if (!ptrGetProcAddress)
        UnicowsImportError("kernel32.dll", "GetProcAddress");
}

/* ------------------------------------------------------------------------ *
 * Implementation of symbols redirection:                                   *
 * ------------------------------------------------------------------------ */

#define DLL_KERNEL32        0
#define DLL_USER32          1
#define DLL_GDI32           2
#define DLL_COMDLG32        3
#define DLL_WINSPOOL        4
#define DLL_SHELL32         5
#define DLL_WINMM           6
#define DLL_ADVAPI32        7
#define DLL_VERSION         8
#define DLL_MPR             9
#define DLL_OLEACC         10
#define DLL_OLEDLG         11
#define DLL_RASAPI32       12
#define DLL_MSVFW32        13
#define DLL_SENSAPI        14
#define DLL_AVICAP32       15
#define DLL_SECUR32        16

#define DLLS_COUNT         17

static HMODULE dllHandles[DLLS_COUNT] = {0};
static HMODULE dllUnicowsHandle = 0;
static const char *dllNames[DLLS_COUNT] =
    {
      "kernel32.dll", "user32.dll", "gdi32.dll", "comdlg32.dll",
      "winspool.drv", "shell32.dll", "winmm.dll", "advapi32.dll",
      "version.dll", "mpr.dll", "oleacc.dll", "oledlg.dll", "rasapi32.dll",
      "msvfw32.dll", "sensapi.dll", "avicap32.dll", "secur32.dll"
    };
static int dllsLoaded = 0;
static int useUnicows = 0;

static void FreeDLLs(void)
{
    size_t i;

    if (!dllsLoaded) return;
    if (useUnicows)
    {
        FreeLibrary(dllUnicowsHandle);
        dllUnicowsHandle = 0;
    }
    else
    {
        for (i = 0; i < DLLS_COUNT; i++)
        {
            if (dllHandles[i])
                FreeLibrary(dllHandles[i]);
            dllHandles[i] = 0;
        }
    }

    if (dllHandleKernel32)
    {
        FreeLibrary(dllHandleKernel32);
        dllHandleKernel32 = 0;
    }

    dllsLoaded = 0;
}


static void LoadDLLs(void)
{
    size_t i;

    LoadGetProcAddress();

    if (GetVersion() < 0x80000000)
    {
        /* Windows NT/2000/XP */
        for (i = 0; i < DLLS_COUNT; i++)
            dllHandles[i] = 0; /* load them on demand */
        useUnicows = 0;
    }
    else
    {
        /* Windows 95/98/ME */
        dllUnicowsHandle = _PfnLoadUnicows();
        if (!dllUnicowsHandle)
            UnicowsImportError(UnicowsDllName, NULL);
        for (i = 0; i < DLLS_COUNT; i++)
            dllHandles[i] = dllUnicowsHandle;
        useUnicows = 1;
    }

    dllsLoaded = 1;
}

void __cdecl LoadUnicowsSymbol(const char *name, int dll, FARPROC stub, FARPROC *output)
{
    if (!dllsLoaded)
    {
        LoadDLLs();
    }

    if (!dllHandles[dll])
    {
        dllHandles[dll] = LoadLibraryA(dllNames[dll]);
        if (!dllHandles[dll])
            UnicowsImportError(dllNames[dll], NULL);
    }

    if (stub && useUnicows)
    {
        *output = stub;
    }
    else
    {
        *output = (*ptrGetProcAddress)(dllHandles[dll], name);
    }

    if (!(*output))
    {
        UnicowsImportError(useUnicows ? UnicowsDllName : dllNames[dll], name);
    }
}
