%include "dll_names.inc"

                    global __imp__DefDlgProcW@16
                    global _DefDlgProcW@16
                    global _Unicows_DefDlgProcW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DefDlgProcW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DefDlgProcW@16     ; place to save the pointer
                    push dword [_Unicows_DefDlgProcW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DefDlgProcW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DefDlgProcW@16]

_DefDlgProcW@16:
                    jmp [__imp__DefDlgProcW@16]


                    section .data

__imp__DefDlgProcW@16:   dd unicows_initial_stub_DefDlgProcW
_Unicows_DefDlgProcW:      dd 0
namestring_DefDlgProcW:    db 'DefDlgProcW',0
