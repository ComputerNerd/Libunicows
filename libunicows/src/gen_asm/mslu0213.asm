%include "dll_names.inc"

                    global __imp__SendMessageW@16
                    global _SendMessageW@16
                    global _Unicows_SendMessageW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SendMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SendMessageW@16     ; place to save the pointer
                    push dword [_Unicows_SendMessageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SendMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SendMessageW@16]

_SendMessageW@16:
                    jmp [__imp__SendMessageW@16]


                    section .data

__imp__SendMessageW@16:   dd unicows_initial_stub_SendMessageW
_Unicows_SendMessageW:      dd 0
namestring_SendMessageW:    db 'SendMessageW',0
