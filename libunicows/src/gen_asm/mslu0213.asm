%include "dll_names.inc"

                    global __imp__SendDlgItemMessageW@20
                    global _SendDlgItemMessageW@20
                    global _Unicows_SendDlgItemMessageW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SendDlgItemMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SendDlgItemMessageW@20     ; place to save the pointer
                    push dword [_Unicows_SendDlgItemMessageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SendDlgItemMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SendDlgItemMessageW@20]

_SendDlgItemMessageW@20:
                    jmp [__imp__SendDlgItemMessageW@20]


                    section .data

__imp__SendDlgItemMessageW@20:   dd unicows_initial_stub_SendDlgItemMessageW
_Unicows_SendDlgItemMessageW:      dd 0
namestring_SendDlgItemMessageW:    db 'SendDlgItemMessageW',0
