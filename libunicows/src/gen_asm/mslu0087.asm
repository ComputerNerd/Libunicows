%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetRoleTextW@12
                    global GetRoleTextW
                    global _GetRoleTextW@12
                    global _Unicows_GetRoleTextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetRoleTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetRoleTextW@12     ; place to save the pointer
                    push dword [_Unicows_GetRoleTextW]      ; default proc, if any
                    push dword OLEACC                  ; dll id
                    push dword namestring_GetRoleTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetRoleTextW:
_GetRoleTextW@12:
                    jmp [__imp__GetRoleTextW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetRoleTextW@12:   dd unicows_initial_stub_GetRoleTextW
_Unicows_GetRoleTextW:      dd 0
namestring_GetRoleTextW:    db 'GetRoleTextW',0
