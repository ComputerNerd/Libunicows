%include "dll_names.inc"

                    global __imp__OleUIConvertW@4
                    global _OleUIConvertW@4
                    global _Unicows_OleUIConvertW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OleUIConvertW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIConvertW@4     ; place to save the pointer
                    push dword [_Unicows_OleUIConvertW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIConvertW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OleUIConvertW@4]

_OleUIConvertW@4:
                    jmp [__imp__OleUIConvertW@4]


                    section .data

__imp__OleUIConvertW@4:   dd unicows_initial_stub_OleUIConvertW
_Unicows_OleUIConvertW:      dd 0
namestring_OleUIConvertW:    db 'OleUIConvertW',0
