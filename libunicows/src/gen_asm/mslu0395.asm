%include "dll_names.inc"

                    global __imp__ReadConsoleW@20
                    global _ReadConsoleW@20
                    global _Unicows_ReadConsoleW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ReadConsoleW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ReadConsoleW@20     ; place to save the pointer
                    push dword [_Unicows_ReadConsoleW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_ReadConsoleW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ReadConsoleW@20]

_ReadConsoleW@20:
                    jmp [__imp__ReadConsoleW@20]


                    section .data

__imp__ReadConsoleW@20:   dd unicows_initial_stub_ReadConsoleW
_Unicows_ReadConsoleW:      dd 0
namestring_ReadConsoleW:    db 'ReadConsoleW',0
