%include "dll_names.inc"

                    global __imp__OleUIAddVerbMenuW@36
                    global _OleUIAddVerbMenuW@36
                    global _Unicows_OleUIAddVerbMenuW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OleUIAddVerbMenuW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIAddVerbMenuW@36     ; place to save the pointer
                    push dword [_Unicows_OleUIAddVerbMenuW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIAddVerbMenuW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OleUIAddVerbMenuW@36]

_OleUIAddVerbMenuW@36:
                    jmp [__imp__OleUIAddVerbMenuW@36]


                    section .data

__imp__OleUIAddVerbMenuW@36:   dd unicows_initial_stub_OleUIAddVerbMenuW
_Unicows_OleUIAddVerbMenuW:      dd 0
namestring_OleUIAddVerbMenuW:    db 'OleUIAddVerbMenuW',0
