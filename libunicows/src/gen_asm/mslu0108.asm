%include "dll_names.inc"

                    global __imp__CharNextW@4
                    global _CharNextW@4
                    global _Unicows_CharNextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CharNextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CharNextW@4     ; place to save the pointer
                    push dword [_Unicows_CharNextW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CharNextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CharNextW@4]

_CharNextW@4:
                    jmp [__imp__CharNextW@4]


                    section .data

__imp__CharNextW@4:   dd unicows_initial_stub_CharNextW
_Unicows_CharNextW:      dd 0
namestring_CharNextW:    db 'CharNextW',0
