%include "dll_names.inc"

                    global __imp__RegisterClassExW@4
                    global _RegisterClassExW@4
                    global _Unicows_RegisterClassExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegisterClassExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegisterClassExW@4     ; place to save the pointer
                    push dword [_Unicows_RegisterClassExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_RegisterClassExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegisterClassExW@4]

_RegisterClassExW@4:
                    jmp [__imp__RegisterClassExW@4]


                    section .data

__imp__RegisterClassExW@4:   dd unicows_initial_stub_RegisterClassExW
_Unicows_RegisterClassExW:      dd 0
namestring_RegisterClassExW:    db 'RegisterClassExW',0
