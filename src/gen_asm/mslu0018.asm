%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WNetOpenEnumW@20
                    global WNetOpenEnumW
                    global _WNetOpenEnumW@20
                    global _Unicows_WNetOpenEnumW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetOpenEnumW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetOpenEnumW@20     ; place to save the pointer
                    push dword [_Unicows_WNetOpenEnumW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetOpenEnumW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetOpenEnumW:
_WNetOpenEnumW@20:
                    jmp [__imp__WNetOpenEnumW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetOpenEnumW@20:   dd unicows_initial_stub_WNetOpenEnumW
_Unicows_WNetOpenEnumW:      dd 0
namestring_WNetOpenEnumW:    db 'WNetOpenEnumW',0
