%include "dll_names.inc"

                    global __imp__WriteConsoleOutputCharacterW@20
                    global _WriteConsoleOutputCharacterW@20
                    global _Unicows_WriteConsoleOutputCharacterW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WriteConsoleOutputCharacterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WriteConsoleOutputCharacterW@20     ; place to save the pointer
                    push dword [_Unicows_WriteConsoleOutputCharacterW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WriteConsoleOutputCharacterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WriteConsoleOutputCharacterW@20]

_WriteConsoleOutputCharacterW@20:
                    jmp [__imp__WriteConsoleOutputCharacterW@20]


                    section .data

__imp__WriteConsoleOutputCharacterW@20:   dd unicows_initial_stub_WriteConsoleOutputCharacterW
_Unicows_WriteConsoleOutputCharacterW:      dd 0
namestring_WriteConsoleOutputCharacterW:    db 'WriteConsoleOutputCharacterW',0
