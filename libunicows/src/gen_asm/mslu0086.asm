%include "dll_names.inc"

                    global __imp__GetRoleTextW@12
                    global _GetRoleTextW@12
                    global _Unicows_GetRoleTextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

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

                    ; ...and skip to it
                    jmp [__imp__GetRoleTextW@12]

_GetRoleTextW@12:
                    jmp [__imp__GetRoleTextW@12]


                    section .data

__imp__GetRoleTextW@12:   dd unicows_initial_stub_GetRoleTextW
_Unicows_GetRoleTextW:      dd 0
namestring_GetRoleTextW:    db 'GetRoleTextW',0
