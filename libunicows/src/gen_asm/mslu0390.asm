%include "dll_names.inc"

                    global __imp__ReadConsoleOutputW@20
                    global _ReadConsoleOutputW@20
                    global _Unicows_ReadConsoleOutputW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ReadConsoleOutputW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ReadConsoleOutputW@20     ; place to save the pointer
                    push dword [_Unicows_ReadConsoleOutputW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_ReadConsoleOutputW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ReadConsoleOutputW@20]

_ReadConsoleOutputW@20:
                    jmp [__imp__ReadConsoleOutputW@20]


                    section .data

__imp__ReadConsoleOutputW@20:   dd unicows_initial_stub_ReadConsoleOutputW
_Unicows_ReadConsoleOutputW:      dd 0
namestring_ReadConsoleOutputW:    db 'ReadConsoleOutputW',0
