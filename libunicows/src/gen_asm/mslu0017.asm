%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WNetGetUserW@12
                    global WNetGetUserW
                    global _WNetGetUserW@12
                    global _Unicows_WNetGetUserW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetGetUserW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetUserW@12     ; place to save the pointer
                    push dword [_Unicows_WNetGetUserW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetUserW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetGetUserW:
_WNetGetUserW@12:
                    jmp [__imp__WNetGetUserW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetGetUserW@12:   dd unicows_initial_stub_WNetGetUserW
_Unicows_WNetGetUserW:      dd 0
namestring_WNetGetUserW:    db 'WNetGetUserW',0
