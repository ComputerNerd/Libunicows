%include "dll_names.inc"

                    global __imp__ReplaceTextW@4
                    global _ReplaceTextW@4
                    global _Unicows_ReplaceTextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ReplaceTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ReplaceTextW@4     ; place to save the pointer
                    push dword [_Unicows_ReplaceTextW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_ReplaceTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ReplaceTextW@4]

_ReplaceTextW@4:
                    jmp [__imp__ReplaceTextW@4]


                    section .data

__imp__ReplaceTextW@4:   dd unicows_initial_stub_ReplaceTextW
_Unicows_ReplaceTextW:      dd 0
namestring_ReplaceTextW:    db 'ReplaceTextW',0
