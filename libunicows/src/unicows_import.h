/*
 * Copyright (c) 2001-2004 Vaclav Slavik
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE. 
 * 
 * $Id$
 * 
 */

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

extern void __cdecl LoadUnicowsSymbol(const char *name, int dll, FARPROC stub, FARPROC *output);


#endif // __UNICOWS_IMPORT_H__
