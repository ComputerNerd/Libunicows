%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetUserNameW@8
                    global GetUserNameW
                    global _GetUserNameW@8
                    global _Unicows_GetUserNameW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetUserNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetUserNameW@8     ; place to save the pointer
                    push dword [_Unicows_GetUserNameW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_GetUserNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetUserNameW:
_GetUserNameW@8:
                    jmp [__imp__GetUserNameW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetUserNameW@8:   dd unicows_initial_stub_GetUserNameW
_Unicows_GetUserNameW:      dd 0
namestring_GetUserNameW:    db 'GetUserNameW',0
