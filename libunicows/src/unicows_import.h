
#ifndef __UNICOWS_IMPORT_H__
#define __UNICOWS_IMPORT_H__

/* --- These are mentioned here for documentation purposes --- */

/* You can add custom routine for loading unicows.dll here. Useful when you want
   to use non-default name of the DLL, e.g. myapp_unicows.dll  */
extern HMODULE (__stdcall *_PfnLoadUnicows)(void);

/* More convenient way of defining another name for unicows.dll.
   Note that this is *not* compatible with Microsoft's MSVC import library! */
extern const char *UnicowsDllName;

/* Called when import failed. You may "redirect" this hook to your own function.
   Note that this is *not* compatible with Microsoft's MSVC import library! */
extern void (__stdcall *UnicowsImportError)(const char *dll, const char *symbol);



/* --- Internal stuff for runtime loading --- */

extern void LoadUnicowsSymbol(const char *name, int dll, FARPROC stub, FARPROC *output);


#endif // __UNICOWS_IMPORT_H__
