%include "dll_names.inc"

                    global __imp__PeekMessageW@20
                    global _PeekMessageW@20
                    global _Unicows_PeekMessageW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_PeekMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__PeekMessageW@20     ; place to save the pointer
                    push dword [_Unicows_PeekMessageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_PeekMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__PeekMessageW@20]

_PeekMessageW@20:
                    jmp [__imp__PeekMessageW@20]


                    section .data

__imp__PeekMessageW@20:   dd unicows_initial_stub_PeekMessageW
_Unicows_PeekMessageW:      dd 0
namestring_PeekMessageW:    db 'PeekMessageW',0
