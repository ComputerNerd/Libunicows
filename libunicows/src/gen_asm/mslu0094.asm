%include "dll_names.inc"

                    global __imp__OleUIInsertObjectW@4
                    global _OleUIInsertObjectW@4
                    global _Unicows_OleUIInsertObjectW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OleUIInsertObjectW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIInsertObjectW@4     ; place to save the pointer
                    push dword [_Unicows_OleUIInsertObjectW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIInsertObjectW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OleUIInsertObjectW@4]

_OleUIInsertObjectW@4:
                    jmp [__imp__OleUIInsertObjectW@4]


                    section .data

__imp__OleUIInsertObjectW@4:   dd unicows_initial_stub_OleUIInsertObjectW
_Unicows_OleUIInsertObjectW:      dd 0
namestring_OleUIInsertObjectW:    db 'OleUIInsertObjectW',0
