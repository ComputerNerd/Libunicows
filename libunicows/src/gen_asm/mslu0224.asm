%include "dll_names.inc"

                    global __imp__SetWindowLongW@12
                    global _SetWindowLongW@12
                    global _Unicows_SetWindowLongW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetWindowLongW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetWindowLongW@12     ; place to save the pointer
                    push dword [_Unicows_SetWindowLongW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetWindowLongW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetWindowLongW@12]

_SetWindowLongW@12:
                    jmp [__imp__SetWindowLongW@12]


                    section .data

__imp__SetWindowLongW@12:   dd unicows_initial_stub_SetWindowLongW
_Unicows_SetWindowLongW:      dd 0
namestring_SetWindowLongW:    db 'SetWindowLongW',0
