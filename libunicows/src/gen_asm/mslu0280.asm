%include "dll_names.inc"

                    global __imp__ChooseColorW@4
                    global _ChooseColorW@4
                    global _Unicows_ChooseColorW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ChooseColorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ChooseColorW@4     ; place to save the pointer
                    push dword [_Unicows_ChooseColorW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_ChooseColorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ChooseColorW@4]

_ChooseColorW@4:
                    jmp [__imp__ChooseColorW@4]


                    section .data

__imp__ChooseColorW@4:   dd unicows_initial_stub_ChooseColorW
_Unicows_ChooseColorW:      dd 0
namestring_ChooseColorW:    db 'ChooseColorW',0
