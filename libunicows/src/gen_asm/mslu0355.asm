%include "dll_names.inc"

                    global __imp__GetPrivateProfileStructW@20
                    global _GetPrivateProfileStructW@20
                    global _Unicows_GetPrivateProfileStructW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetPrivateProfileStructW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrivateProfileStructW@20     ; place to save the pointer
                    push dword [_Unicows_GetPrivateProfileStructW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetPrivateProfileStructW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetPrivateProfileStructW@20]

_GetPrivateProfileStructW@20:
                    jmp [__imp__GetPrivateProfileStructW@20]


                    section .data

__imp__GetPrivateProfileStructW@20:   dd unicows_initial_stub_GetPrivateProfileStructW
_Unicows_GetPrivateProfileStructW:      dd 0
namestring_GetPrivateProfileStructW:    db 'GetPrivateProfileStructW',0
