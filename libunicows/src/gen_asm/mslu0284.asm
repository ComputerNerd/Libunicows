%include "dll_names.inc"

                    global __imp__PrintDlgW@4
                    global _PrintDlgW@4
                    global _Unicows_PrintDlgW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_PrintDlgW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__PrintDlgW@4     ; place to save the pointer
                    push dword [_Unicows_PrintDlgW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_PrintDlgW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__PrintDlgW@4]

_PrintDlgW@4:
                    jmp [__imp__PrintDlgW@4]


                    section .data

__imp__PrintDlgW@4:   dd unicows_initial_stub_PrintDlgW
_Unicows_PrintDlgW:      dd 0
namestring_PrintDlgW:    db 'PrintDlgW',0
