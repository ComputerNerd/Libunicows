%include "dll_names.inc"

                    global __imp__OleUIUpdateLinksW@16
                    global _OleUIUpdateLinksW@16
                    global _Unicows_OleUIUpdateLinksW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OleUIUpdateLinksW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIUpdateLinksW@16     ; place to save the pointer
                    push dword [_Unicows_OleUIUpdateLinksW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIUpdateLinksW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OleUIUpdateLinksW@16]

_OleUIUpdateLinksW@16:
                    jmp [__imp__OleUIUpdateLinksW@16]


                    section .data

__imp__OleUIUpdateLinksW@16:   dd unicows_initial_stub_OleUIUpdateLinksW
_Unicows_OleUIUpdateLinksW:      dd 0
namestring_OleUIUpdateLinksW:    db 'OleUIUpdateLinksW',0
