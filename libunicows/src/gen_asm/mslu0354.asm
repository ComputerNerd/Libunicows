%include "dll_names.inc"

                    global __imp__GetPrivateProfileIntW@16
                    global _GetPrivateProfileIntW@16
                    global _Unicows_GetPrivateProfileIntW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetPrivateProfileIntW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrivateProfileIntW@16     ; place to save the pointer
                    push dword [_Unicows_GetPrivateProfileIntW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetPrivateProfileIntW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetPrivateProfileIntW@16]

_GetPrivateProfileIntW@16:
                    jmp [__imp__GetPrivateProfileIntW@16]


                    section .data

__imp__GetPrivateProfileIntW@16:   dd unicows_initial_stub_GetPrivateProfileIntW
_Unicows_GetPrivateProfileIntW:      dd 0
namestring_GetPrivateProfileIntW:    db 'GetPrivateProfileIntW',0
