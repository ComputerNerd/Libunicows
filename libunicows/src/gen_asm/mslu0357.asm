%include "dll_names.inc"

                    global __imp__GetPrivateProfileStringW@24
                    global _GetPrivateProfileStringW@24
                    global _Unicows_GetPrivateProfileStringW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetPrivateProfileStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrivateProfileStringW@24     ; place to save the pointer
                    push dword [_Unicows_GetPrivateProfileStringW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetPrivateProfileStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetPrivateProfileStringW@24]

_GetPrivateProfileStringW@24:
                    jmp [__imp__GetPrivateProfileStringW@24]


                    section .data

__imp__GetPrivateProfileStringW@24:   dd unicows_initial_stub_GetPrivateProfileStringW
_Unicows_GetPrivateProfileStringW:      dd 0
namestring_GetPrivateProfileStringW:    db 'GetPrivateProfileStringW',0
