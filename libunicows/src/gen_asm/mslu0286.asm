%include "dll_names.inc"

                    global __imp__PageSetupDlgW@4
                    global _PageSetupDlgW@4
                    global _Unicows_PageSetupDlgW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_PageSetupDlgW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__PageSetupDlgW@4     ; place to save the pointer
                    push dword [_Unicows_PageSetupDlgW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_PageSetupDlgW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__PageSetupDlgW@4]

_PageSetupDlgW@4:
                    jmp [__imp__PageSetupDlgW@4]


                    section .data

__imp__PageSetupDlgW@4:   dd unicows_initial_stub_PageSetupDlgW
_Unicows_PageSetupDlgW:      dd 0
namestring_PageSetupDlgW:    db 'PageSetupDlgW',0
