%include "dll_names.inc"

                    global __imp__PeekConsoleInputW@16
                    global _PeekConsoleInputW@16
                    global _Unicows_PeekConsoleInputW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_PeekConsoleInputW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__PeekConsoleInputW@16     ; place to save the pointer
                    push dword [_Unicows_PeekConsoleInputW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_PeekConsoleInputW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__PeekConsoleInputW@16]

_PeekConsoleInputW@16:
                    jmp [__imp__PeekConsoleInputW@16]


                    section .data

__imp__PeekConsoleInputW@16:   dd unicows_initial_stub_PeekConsoleInputW
_Unicows_PeekConsoleInputW:      dd 0
namestring_PeekConsoleInputW:    db 'PeekConsoleInputW',0
