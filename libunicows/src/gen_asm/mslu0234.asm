%include "dll_names.inc"

                    global __imp__WinHelpW@16
                    global _WinHelpW@16
                    global _Unicows_WinHelpW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WinHelpW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WinHelpW@16     ; place to save the pointer
                    push dword [_Unicows_WinHelpW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_WinHelpW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WinHelpW@16]

_WinHelpW@16:
                    jmp [__imp__WinHelpW@16]


                    section .data

__imp__WinHelpW@16:   dd unicows_initial_stub_WinHelpW
_Unicows_WinHelpW:      dd 0
namestring_WinHelpW:    db 'WinHelpW',0
