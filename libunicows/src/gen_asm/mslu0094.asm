%include "dll_names.inc"

                    global __imp__OleUIEditLinksW@4
                    global _OleUIEditLinksW@4
                    global _Unicows_OleUIEditLinksW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OleUIEditLinksW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIEditLinksW@4     ; place to save the pointer
                    push dword [_Unicows_OleUIEditLinksW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIEditLinksW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OleUIEditLinksW@4]

_OleUIEditLinksW@4:
                    jmp [__imp__OleUIEditLinksW@4]


                    section .data

__imp__OleUIEditLinksW@4:   dd unicows_initial_stub_OleUIEditLinksW
_Unicows_OleUIEditLinksW:      dd 0
namestring_OleUIEditLinksW:    db 'OleUIEditLinksW',0
