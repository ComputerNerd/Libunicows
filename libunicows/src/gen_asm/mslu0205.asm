%include "dll_names.inc"

                    global __imp__PostThreadMessageW@16
                    global _PostThreadMessageW@16
                    global _Unicows_PostThreadMessageW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_PostThreadMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__PostThreadMessageW@16     ; place to save the pointer
                    push dword [_Unicows_PostThreadMessageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_PostThreadMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__PostThreadMessageW@16]

_PostThreadMessageW@16:
                    jmp [__imp__PostThreadMessageW@16]


                    section .data

__imp__PostThreadMessageW@16:   dd unicows_initial_stub_PostThreadMessageW
_Unicows_PostThreadMessageW:      dd 0
namestring_PostThreadMessageW:    db 'PostThreadMessageW',0
