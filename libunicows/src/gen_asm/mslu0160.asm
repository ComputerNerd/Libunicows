%include "dll_names.inc"

                    global __imp__GetDlgItemTextW@16
                    global _GetDlgItemTextW@16
                    global _Unicows_GetDlgItemTextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetDlgItemTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetDlgItemTextW@16     ; place to save the pointer
                    push dword [_Unicows_GetDlgItemTextW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetDlgItemTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetDlgItemTextW@16]

_GetDlgItemTextW@16:
                    jmp [__imp__GetDlgItemTextW@16]


                    section .data

__imp__GetDlgItemTextW@16:   dd unicows_initial_stub_GetDlgItemTextW
_Unicows_GetDlgItemTextW:      dd 0
namestring_GetDlgItemTextW:    db 'GetDlgItemTextW',0
