%include "dll_names.inc"

                    global __imp__IsCharAlphaW@4
                    global _IsCharAlphaW@4
                    global _Unicows_IsCharAlphaW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_IsCharAlphaW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsCharAlphaW@4     ; place to save the pointer
                    push dword [_Unicows_IsCharAlphaW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_IsCharAlphaW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__IsCharAlphaW@4]

_IsCharAlphaW@4:
                    jmp [__imp__IsCharAlphaW@4]


                    section .data

__imp__IsCharAlphaW@4:   dd unicows_initial_stub_IsCharAlphaW
_Unicows_IsCharAlphaW:      dd 0
namestring_IsCharAlphaW:    db 'IsCharAlphaW',0
