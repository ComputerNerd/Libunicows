%include "dll_names.inc"

                    global __imp__CreateProcessW@40
                    global _CreateProcessW@40
                    global _Unicows_CreateProcessW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateProcessW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateProcessW@40     ; place to save the pointer
                    push dword [_Unicows_CreateProcessW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateProcessW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateProcessW@40]

_CreateProcessW@40:
                    jmp [__imp__CreateProcessW@40]


                    section .data

__imp__CreateProcessW@40:   dd unicows_initial_stub_CreateProcessW
_Unicows_CreateProcessW:      dd 0
namestring_CreateProcessW:    db 'CreateProcessW',0
