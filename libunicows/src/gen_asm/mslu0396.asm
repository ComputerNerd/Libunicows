%include "dll_names.inc"

                    global __imp__SetComputerNameW@4
                    global _SetComputerNameW@4
                    global _Unicows_SetComputerNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetComputerNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetComputerNameW@4     ; place to save the pointer
                    push dword [_Unicows_SetComputerNameW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SetComputerNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetComputerNameW@4]

_SetComputerNameW@4:
                    jmp [__imp__SetComputerNameW@4]


                    section .data

__imp__SetComputerNameW@4:   dd unicows_initial_stub_SetComputerNameW
_Unicows_SetComputerNameW:      dd 0
namestring_SetComputerNameW:    db 'SetComputerNameW',0
