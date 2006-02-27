%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetStateTextW@12
                    global GetStateTextW
                    global _GetStateTextW@12
                    global _Unicows_GetStateTextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetStateTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetStateTextW@12     ; place to save the pointer
                    push dword [_Unicows_GetStateTextW]      ; default proc, if any
                    push dword OLEACC                  ; dll id
                    push dword namestring_GetStateTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetStateTextW:
_GetStateTextW@12:
                    jmp [__imp__GetStateTextW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetStateTextW@12:   dd unicows_initial_stub_GetStateTextW
_Unicows_GetStateTextW:      dd 0
namestring_GetStateTextW:    db 'GetStateTextW',0
