%include "dll_names.inc"

                    global __imp__SendMessageCallbackW@24
                    global _SendMessageCallbackW@24
                    global _Unicows_SendMessageCallbackW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SendMessageCallbackW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SendMessageCallbackW@24     ; place to save the pointer
                    push dword [_Unicows_SendMessageCallbackW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SendMessageCallbackW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SendMessageCallbackW@24]

_SendMessageCallbackW@24:
                    jmp [__imp__SendMessageCallbackW@24]


                    section .data

__imp__SendMessageCallbackW@24:   dd unicows_initial_stub_SendMessageCallbackW
_Unicows_SendMessageCallbackW:      dd 0
namestring_SendMessageCallbackW:    db 'SendMessageCallbackW',0
