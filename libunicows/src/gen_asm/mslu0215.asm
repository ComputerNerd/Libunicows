%include "dll_names.inc"

                    global __imp__SetClassLongW@12
                    global _SetClassLongW@12
                    global _Unicows_SetClassLongW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetClassLongW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetClassLongW@12     ; place to save the pointer
                    push dword [_Unicows_SetClassLongW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetClassLongW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetClassLongW@12]

_SetClassLongW@12:
                    jmp [__imp__SetClassLongW@12]


                    section .data

__imp__SetClassLongW@12:   dd unicows_initial_stub_SetClassLongW
_Unicows_SetClassLongW:      dd 0
namestring_SetClassLongW:    db 'SetClassLongW',0
