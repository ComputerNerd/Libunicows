%include "dll_names.inc"

                    global __imp__OleUIBusyW@4
                    global _OleUIBusyW@4
                    global _Unicows_OleUIBusyW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OleUIBusyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIBusyW@4     ; place to save the pointer
                    push dword [_Unicows_OleUIBusyW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIBusyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OleUIBusyW@4]

_OleUIBusyW@4:
                    jmp [__imp__OleUIBusyW@4]


                    section .data

__imp__OleUIBusyW@4:   dd unicows_initial_stub_OleUIBusyW
_Unicows_OleUIBusyW:      dd 0
namestring_OleUIBusyW:    db 'OleUIBusyW',0
