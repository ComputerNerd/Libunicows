%include "dll_names.inc"

                    global __imp__GetConsoleTitleW@8
                    global _GetConsoleTitleW@8
                    global _Unicows_GetConsoleTitleW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetConsoleTitleW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetConsoleTitleW@8     ; place to save the pointer
                    push dword [_Unicows_GetConsoleTitleW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetConsoleTitleW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetConsoleTitleW@8]

_GetConsoleTitleW@8:
                    jmp [__imp__GetConsoleTitleW@8]


                    section .data

__imp__GetConsoleTitleW@8:   dd unicows_initial_stub_GetConsoleTitleW
_Unicows_GetConsoleTitleW:      dd 0
namestring_GetConsoleTitleW:    db 'GetConsoleTitleW',0
