%include "dll_names.inc"

                    global __imp__SetJobW@20
                    global _SetJobW@20
                    global _Unicows_SetJobW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetJobW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetJobW@20     ; place to save the pointer
                    push dword [_Unicows_SetJobW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_SetJobW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetJobW@20]

_SetJobW@20:
                    jmp [__imp__SetJobW@20]


                    section .data

__imp__SetJobW@20:   dd unicows_initial_stub_SetJobW
_Unicows_SetJobW:      dd 0
namestring_SetJobW:    db 'SetJobW',0
