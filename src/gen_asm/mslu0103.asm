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

                    global __imp__CallMsgFilterW@8
                    global CallMsgFilterW
                    global _CallMsgFilterW@8
                    global _Unicows_CallMsgFilterW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CallMsgFilterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CallMsgFilterW@8     ; place to save the pointer
                    push dword [_Unicows_CallMsgFilterW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CallMsgFilterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CallMsgFilterW:
_CallMsgFilterW@8:
                    jmp [__imp__CallMsgFilterW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CallMsgFilterW@8:   dd unicows_initial_stub_CallMsgFilterW
_Unicows_CallMsgFilterW:      dd 0
namestring_CallMsgFilterW:    db 'CallMsgFilterW',0
