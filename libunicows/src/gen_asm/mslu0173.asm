%include "dll_names.inc"

                    global __imp__GetWindowTextLengthW@4
                    global _GetWindowTextLengthW@4
                    global _Unicows_GetWindowTextLengthW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetWindowTextLengthW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetWindowTextLengthW@4     ; place to save the pointer
                    push dword [_Unicows_GetWindowTextLengthW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetWindowTextLengthW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetWindowTextLengthW@4]

_GetWindowTextLengthW@4:
                    jmp [__imp__GetWindowTextLengthW@4]


                    section .data

__imp__GetWindowTextLengthW@4:   dd unicows_initial_stub_GetWindowTextLengthW
_Unicows_GetWindowTextLengthW:      dd 0
namestring_GetWindowTextLengthW:    db 'GetWindowTextLengthW',0
