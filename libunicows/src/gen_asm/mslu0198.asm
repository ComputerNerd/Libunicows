%include "dll_names.inc"

                    global __imp__OemToCharBuffW@12
                    global _OemToCharBuffW@12
                    global _Unicows_OemToCharBuffW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OemToCharBuffW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OemToCharBuffW@12     ; place to save the pointer
                    push dword [_Unicows_OemToCharBuffW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_OemToCharBuffW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OemToCharBuffW@12]

_OemToCharBuffW@12:
                    jmp [__imp__OemToCharBuffW@12]


                    section .data

__imp__OemToCharBuffW@12:   dd unicows_initial_stub_OemToCharBuffW
_Unicows_OemToCharBuffW:      dd 0
namestring_OemToCharBuffW:    db 'OemToCharBuffW',0
