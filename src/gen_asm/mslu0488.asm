;
; Copyright (c) 2001-2004 Vaclav Slavik
; 
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to
; deal in the Software without restriction, including without limitation the
; rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
; sell copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
; 
; The above copyright notice and this permission notice shall be included in
; all copies or substantial portions of the Software.
; 
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
; IN THE SOFTWARE. 
;
; $Id$

%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__ResetPrinterW@8
                    global ResetPrinterW
                    global _ResetPrinterW@8
                    global _Unicows_ResetPrinterW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ResetPrinterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ResetPrinterW@8     ; place to save the pointer
                    push dword [_Unicows_ResetPrinterW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_ResetPrinterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ResetPrinterW:
_ResetPrinterW@8:
                    jmp [__imp__ResetPrinterW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ResetPrinterW@8:   dd unicows_initial_stub_ResetPrinterW
_Unicows_ResetPrinterW:      dd 0
namestring_ResetPrinterW:    db 'ResetPrinterW',0
