%include "dll_names.inc"

                    global __imp__ShellExecuteW@24
                    global _ShellExecuteW@24
                    global _Unicows_ShellExecuteW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ShellExecuteW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ShellExecuteW@24     ; place to save the pointer
                    push dword [_Unicows_ShellExecuteW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_ShellExecuteW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ShellExecuteW@24]

_ShellExecuteW@24:
                    jmp [__imp__ShellExecuteW@24]


                    section .data

__imp__ShellExecuteW@24:   dd unicows_initial_stub_ShellExecuteW
_Unicows_ShellExecuteW:      dd 0
namestring_ShellExecuteW:    db 'ShellExecuteW',0
