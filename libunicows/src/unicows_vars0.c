
#include <windows.h>

// This is MSLU variable used to override unicows.dll loading. It is in
// separate file so that the linker can play dirty tricks with it. In
// particular, if one of app's object files define this symbol, this object
// file (stored in unicows.lib) is never used and so the variable is
// initially non-NULL.
// See http://tinyurl.com/5depf for explanation of linker's behaviour.
HMODULE (__stdcall *_PfnLoadUnicows)(void) = NULL;
