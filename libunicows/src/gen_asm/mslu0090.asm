%include "dll_names.inc"

                    global __imp__OleUIChangeIconW@4
                    global _OleUIChangeIconW@4
                    global _Unicows_OleUIChangeIconW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OleUIChangeIconW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIChangeIconW@4     ; place to save the pointer
                    push dword [_Unicows_OleUIChangeIconW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIChangeIconW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OleUIChangeIconW@4]

_OleUIChangeIconW@4:
                    jmp [__imp__OleUIChangeIconW@4]


                    section .data

__imp__OleUIChangeIconW@4:   dd unicows_initial_stub_OleUIChangeIconW
_Unicows_OleUIChangeIconW:      dd 0
namestring_OleUIChangeIconW:    db 'OleUIChangeIconW',0
