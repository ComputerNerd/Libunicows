%include "dll_names.inc"

                    global __imp__PostMessageW@16
                    global _PostMessageW@16
                    global _Unicows_PostMessageW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_PostMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__PostMessageW@16     ; place to save the pointer
                    push dword [_Unicows_PostMessageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_PostMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__PostMessageW@16]

_PostMessageW@16:
                    jmp [__imp__PostMessageW@16]


                    section .data

__imp__PostMessageW@16:   dd unicows_initial_stub_PostMessageW
_Unicows_PostMessageW:      dd 0
namestring_PostMessageW:    db 'PostMessageW',0
