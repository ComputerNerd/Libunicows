%include "dll_names.inc"

                    global __imp__GetUserNameW@8
                    global _GetUserNameW@8
                    global _Unicows_GetUserNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

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

                    ; ...and skip to it
                    jmp [__imp__GetUserNameW@8]

_GetUserNameW@8:
                    jmp [__imp__GetUserNameW@8]


                    section .data

__imp__GetUserNameW@8:   dd unicows_initial_stub_GetUserNameW
_Unicows_GetUserNameW:      dd 0
namestring_GetUserNameW:    db 'GetUserNameW',0
