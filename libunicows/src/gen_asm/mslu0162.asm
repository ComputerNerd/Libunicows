%include "dll_names.inc"

                    global __imp__GetMessageW@16
                    global _GetMessageW@16
                    global _Unicows_GetMessageW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetMessageW@16     ; place to save the pointer
                    push dword [_Unicows_GetMessageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetMessageW@16]

_GetMessageW@16:
                    jmp [__imp__GetMessageW@16]


                    section .data

__imp__GetMessageW@16:   dd unicows_initial_stub_GetMessageW
_Unicows_GetMessageW:      dd 0
namestring_GetMessageW:    db 'GetMessageW',0
