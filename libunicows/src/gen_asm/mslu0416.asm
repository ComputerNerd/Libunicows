%include "dll_names.inc"

                    global __imp__WritePrivateProfileStringW@16
                    global _WritePrivateProfileStringW@16
                    global _Unicows_WritePrivateProfileStringW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WritePrivateProfileStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WritePrivateProfileStringW@16     ; place to save the pointer
                    push dword [_Unicows_WritePrivateProfileStringW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WritePrivateProfileStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WritePrivateProfileStringW@16]

_WritePrivateProfileStringW@16:
                    jmp [__imp__WritePrivateProfileStringW@16]


                    section .data

__imp__WritePrivateProfileStringW@16:   dd unicows_initial_stub_WritePrivateProfileStringW
_Unicows_WritePrivateProfileStringW:      dd 0
namestring_WritePrivateProfileStringW:    db 'WritePrivateProfileStringW',0
