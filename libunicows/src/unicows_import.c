
#include <windows.h>
#include "unicows_import.h"


/* Standard implementations: */

static HMODULE __stdcall StdLoadUnicows(void)
{
    return LoadLibraryA(UnicowsDllName);
}

// avoid using CRT
static void my_strcat(char *dst, const char *src)
{
	char *cd;
	const char *cs;
	
	for (cd = dst; *cd; cd++) {}
	for (cs = src; *cs; ) *(cd++) = *(cs++);
	*cd = 0;
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
	my_strcat(buffer, "'!\nThe application will terminate now.");
    MessageBoxA(NULL, buffer, "Fatal error", MB_ICONSTOP);
    ExitProcess(1);
}


/* Hooks: */

HMODULE (__stdcall *_PfnLoadUnicows)(void) = StdLoadUnicows;
const char *UnicowsDllName = "unicows.dll";
void (__stdcall *UnicowsImportError)(const char *, const char *) = StdImportError;


/* Implementation: */

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

#define DLLS_COUNT         13

static HMODULE dllHandles[DLLS_COUNT] = {0};
static HMODULE dllUnicowsHandle = 0;
static const char *dllNames[DLLS_COUNT] =
    { "kernel32.dll", "user32.dll", "gdi32.dll", "comdlg32.dll", "winspool.dll",
      "shell32.dll", "winmm.dll", "advapi32.dll", "version.dll", "mpr.dll",
      "oleacc.dll", "oledlg.dll", "rasapi32.dll" };
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
    
    dllsLoaded = 0;
}


static void LoadDLLs(void)
{
    size_t i;
    
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

void LoadUnicowsSymbol(const char *name, int dll, FARPROC stub, FARPROC *output)
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
        *output = GetProcAddress(dllHandles[dll], name);
    }
    
    if (!(*output))
    {
        UnicowsImportError(useUnicows ? UnicowsDllName : dllNames[dll], name);
    }
}
