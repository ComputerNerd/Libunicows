%include "dll_names.inc"

                    global __imp__SendMessageTimeoutW@28
                    global _SendMessageTimeoutW@28
                    global _Unicows_SendMessageTimeoutW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SendMessageTimeoutW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SendMessageTimeoutW@28     ; place to save the pointer
                    push dword [_Unicows_SendMessageTimeoutW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SendMessageTimeoutW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SendMessageTimeoutW@28]

_SendMessageTimeoutW@28:
                    jmp [__imp__SendMessageTimeoutW@28]


                    section .data

__imp__SendMessageTimeoutW@28:   dd unicows_initial_stub_SendMessageTimeoutW
_Unicows_SendMessageTimeoutW:      dd 0
namestring_SendMessageTimeoutW:    db 'SendMessageTimeoutW',0
