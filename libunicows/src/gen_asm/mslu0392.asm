%include "dll_names.inc"

                    global __imp__ReadConsoleInputW@16
                    global _ReadConsoleInputW@16
                    global _Unicows_ReadConsoleInputW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ReadConsoleInputW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ReadConsoleInputW@16     ; place to save the pointer
                    push dword [_Unicows_ReadConsoleInputW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_ReadConsoleInputW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ReadConsoleInputW@16]

_ReadConsoleInputW@16:
                    jmp [__imp__ReadConsoleInputW@16]


                    section .data

__imp__ReadConsoleInputW@16:   dd unicows_initial_stub_ReadConsoleInputW
_Unicows_ReadConsoleInputW:      dd 0
namestring_ReadConsoleInputW:    db 'ReadConsoleInputW',0
