%include "dll_names.inc"

                    global __imp__DdeInitializeW@16
                    global _DdeInitializeW@16
                    global _Unicows_DdeInitializeW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DdeInitializeW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DdeInitializeW@16     ; place to save the pointer
                    push dword [_Unicows_DdeInitializeW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DdeInitializeW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DdeInitializeW@16]

_DdeInitializeW@16:
                    jmp [__imp__DdeInitializeW@16]


                    section .data

__imp__DdeInitializeW@16:   dd unicows_initial_stub_DdeInitializeW
_Unicows_DdeInitializeW:      dd 0
namestring_DdeInitializeW:    db 'DdeInitializeW',0
