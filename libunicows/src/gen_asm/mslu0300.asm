%include "dll_names.inc"

                    global __imp__CreateMailslotW@16
                    global _CreateMailslotW@16
                    global _Unicows_CreateMailslotW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateMailslotW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateMailslotW@16     ; place to save the pointer
                    push dword [_Unicows_CreateMailslotW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateMailslotW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateMailslotW@16]

_CreateMailslotW@16:
                    jmp [__imp__CreateMailslotW@16]


                    section .data

__imp__CreateMailslotW@16:   dd unicows_initial_stub_CreateMailslotW
_Unicows_CreateMailslotW:      dd 0
namestring_CreateMailslotW:    db 'CreateMailslotW',0
