%include "dll_names.inc"

                    global __imp__IsCharUpperW@4
                    global _IsCharUpperW@4
                    global _Unicows_IsCharUpperW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_IsCharUpperW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsCharUpperW@4     ; place to save the pointer
                    push dword [_Unicows_IsCharUpperW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_IsCharUpperW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__IsCharUpperW@4]

_IsCharUpperW@4:
                    jmp [__imp__IsCharUpperW@4]


                    section .data

__imp__IsCharUpperW@4:   dd unicows_initial_stub_IsCharUpperW
_Unicows_IsCharUpperW:      dd 0
namestring_IsCharUpperW:    db 'IsCharUpperW',0
