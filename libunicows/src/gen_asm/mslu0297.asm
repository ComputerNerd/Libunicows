%include "dll_names.inc"

                    global __imp__CreateEventW@16
                    global _CreateEventW@16
                    global _Unicows_CreateEventW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateEventW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateEventW@16     ; place to save the pointer
                    push dword [_Unicows_CreateEventW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateEventW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateEventW@16]

_CreateEventW@16:
                    jmp [__imp__CreateEventW@16]


                    section .data

__imp__CreateEventW@16:   dd unicows_initial_stub_CreateEventW
_Unicows_CreateEventW:      dd 0
namestring_CreateEventW:    db 'CreateEventW',0
