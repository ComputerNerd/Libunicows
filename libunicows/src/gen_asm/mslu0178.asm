%include "dll_names.inc"

                    global __imp__IsCharAlphaNumericW@4
                    global _IsCharAlphaNumericW@4
                    global _Unicows_IsCharAlphaNumericW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_IsCharAlphaNumericW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsCharAlphaNumericW@4     ; place to save the pointer
                    push dword [_Unicows_IsCharAlphaNumericW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_IsCharAlphaNumericW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__IsCharAlphaNumericW@4]

_IsCharAlphaNumericW@4:
                    jmp [__imp__IsCharAlphaNumericW@4]


                    section .data

__imp__IsCharAlphaNumericW@4:   dd unicows_initial_stub_IsCharAlphaNumericW
_Unicows_IsCharAlphaNumericW:      dd 0
namestring_IsCharAlphaNumericW:    db 'IsCharAlphaNumericW',0
