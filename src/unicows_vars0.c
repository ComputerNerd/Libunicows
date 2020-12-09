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

#include <windows.h>

/* 
   This is MSLU variable used to override unicows.dll loading. It is in
   separate file so that the linker can play dirty tricks with it. In
   particular, if one of app's object files define this symbol, this object
   file (stored in unicows.lib) is never used and so the variable is
   initially non-NULL.
   See https://groups.google.com/g/microsoft.public.dotnet.languages.vc/c/N_UwQPR6D_c/ for explanation of linker's behaviour.
 */
HMODULE (__stdcall *_PfnLoadUnicows)(void) = NULL;
