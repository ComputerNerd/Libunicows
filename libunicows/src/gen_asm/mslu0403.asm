%include "dll_names.inc"

                    global __imp__SetDefaultCommConfigW@12
                    global _SetDefaultCommConfigW@12
                    global _Unicows_SetDefaultCommConfigW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetDefaultCommConfigW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetDefaultCommConfigW@12     ; place to save the pointer
                    push dword [_Unicows_SetDefaultCommConfigW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SetDefaultCommConfigW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetDefaultCommConfigW@12]

_SetDefaultCommConfigW@12:
                    jmp [__imp__SetDefaultCommConfigW@12]


                    section .data

__imp__SetDefaultCommConfigW@12:   dd unicows_initial_stub_SetDefaultCommConfigW
_Unicows_SetDefaultCommConfigW:      dd 0
namestring_SetDefaultCommConfigW:    db 'SetDefaultCommConfigW',0
