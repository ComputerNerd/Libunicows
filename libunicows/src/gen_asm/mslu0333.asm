%include "dll_names.inc"

                    global __imp__GetComputerNameW@8
                    global _GetComputerNameW@8
                    global _Unicows_GetComputerNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetComputerNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetComputerNameW@8     ; place to save the pointer
                    push dword [_Unicows_GetComputerNameW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetComputerNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetComputerNameW@8]

_GetComputerNameW@8:
                    jmp [__imp__GetComputerNameW@8]


                    section .data

__imp__GetComputerNameW@8:   dd unicows_initial_stub_GetComputerNameW
_Unicows_GetComputerNameW:      dd 0
namestring_GetComputerNameW:    db 'GetComputerNameW',0
