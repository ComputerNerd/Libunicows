%include "dll_names.inc"

                    global __imp__SetWindowLongA@12
                    global _SetWindowLongA@12
                    global _Unicows_SetWindowLongA
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetWindowLongA:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetWindowLongA@12     ; place to save the pointer
                    push dword [_Unicows_SetWindowLongA]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetWindowLongA      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetWindowLongA@12]

_SetWindowLongA@12:
                    jmp [__imp__SetWindowLongA@12]


                    section .data

__imp__SetWindowLongA@12:   dd unicows_initial_stub_SetWindowLongA
_Unicows_SetWindowLongA:      dd 0
namestring_SetWindowLongA:    db 'SetWindowLongA',0
