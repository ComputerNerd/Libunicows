%include "dll_names.inc"

                    global __imp__WriteConsoleInputW@16
                    global _WriteConsoleInputW@16
                    global _Unicows_WriteConsoleInputW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WriteConsoleInputW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WriteConsoleInputW@16     ; place to save the pointer
                    push dword [_Unicows_WriteConsoleInputW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WriteConsoleInputW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WriteConsoleInputW@16]

_WriteConsoleInputW@16:
                    jmp [__imp__WriteConsoleInputW@16]


                    section .data

__imp__WriteConsoleInputW@16:   dd unicows_initial_stub_WriteConsoleInputW
_Unicows_WriteConsoleInputW:      dd 0
namestring_WriteConsoleInputW:    db 'WriteConsoleInputW',0
