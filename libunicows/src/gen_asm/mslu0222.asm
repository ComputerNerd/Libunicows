%include "dll_names.inc"

                    global __imp__SetWindowTextW@8
                    global _SetWindowTextW@8
                    global _Unicows_SetWindowTextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetWindowTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetWindowTextW@8     ; place to save the pointer
                    push dword [_Unicows_SetWindowTextW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetWindowTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetWindowTextW@8]

_SetWindowTextW@8:
                    jmp [__imp__SetWindowTextW@8]


                    section .data

__imp__SetWindowTextW@8:   dd unicows_initial_stub_SetWindowTextW
_Unicows_SetWindowTextW:      dd 0
namestring_SetWindowTextW:    db 'SetWindowTextW',0
