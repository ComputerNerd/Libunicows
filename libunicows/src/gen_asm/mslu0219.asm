%include "dll_names.inc"

                    global __imp__SetDlgItemTextW@12
                    global _SetDlgItemTextW@12
                    global _Unicows_SetDlgItemTextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetDlgItemTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetDlgItemTextW@12     ; place to save the pointer
                    push dword [_Unicows_SetDlgItemTextW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetDlgItemTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetDlgItemTextW@12]

_SetDlgItemTextW@12:
                    jmp [__imp__SetDlgItemTextW@12]


                    section .data

__imp__SetDlgItemTextW@12:   dd unicows_initial_stub_SetDlgItemTextW
_Unicows_SetDlgItemTextW:      dd 0
namestring_SetDlgItemTextW:    db 'SetDlgItemTextW',0
