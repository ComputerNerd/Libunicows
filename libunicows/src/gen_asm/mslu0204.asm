%include "dll_names.inc"

                    global __imp__RegisterClassW@4
                    global _RegisterClassW@4
                    global _Unicows_RegisterClassW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegisterClassW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegisterClassW@4     ; place to save the pointer
                    push dword [_Unicows_RegisterClassW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_RegisterClassW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegisterClassW@4]

_RegisterClassW@4:
                    jmp [__imp__RegisterClassW@4]


                    section .data

__imp__RegisterClassW@4:   dd unicows_initial_stub_RegisterClassW
_Unicows_RegisterClassW:      dd 0
namestring_RegisterClassW:    db 'RegisterClassW',0
