%include "dll_names.inc"

                    global __imp__SetConsoleTitleW@4
                    global _SetConsoleTitleW@4
                    global _Unicows_SetConsoleTitleW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetConsoleTitleW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetConsoleTitleW@4     ; place to save the pointer
                    push dword [_Unicows_SetConsoleTitleW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SetConsoleTitleW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetConsoleTitleW@4]

_SetConsoleTitleW@4:
                    jmp [__imp__SetConsoleTitleW@4]


                    section .data

__imp__SetConsoleTitleW@4:   dd unicows_initial_stub_SetConsoleTitleW
_Unicows_SetConsoleTitleW:      dd 0
namestring_SetConsoleTitleW:    db 'SetConsoleTitleW',0
