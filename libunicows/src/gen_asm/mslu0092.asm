%include "dll_names.inc"

                    global __imp__OleUIChangeSourceW@4
                    global _OleUIChangeSourceW@4
                    global _Unicows_OleUIChangeSourceW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OleUIChangeSourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIChangeSourceW@4     ; place to save the pointer
                    push dword [_Unicows_OleUIChangeSourceW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIChangeSourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OleUIChangeSourceW@4]

_OleUIChangeSourceW@4:
                    jmp [__imp__OleUIChangeSourceW@4]


                    section .data

__imp__OleUIChangeSourceW@4:   dd unicows_initial_stub_OleUIChangeSourceW
_Unicows_OleUIChangeSourceW:      dd 0
namestring_OleUIChangeSourceW:    db 'OleUIChangeSourceW',0
