%include "dll_names.inc"

                    global __imp__GetWindowLongW@8
                    global _GetWindowLongW@8
                    global _Unicows_GetWindowLongW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetWindowLongW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetWindowLongW@8     ; place to save the pointer
                    push dword [_Unicows_GetWindowLongW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetWindowLongW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetWindowLongW@8]

_GetWindowLongW@8:
                    jmp [__imp__GetWindowLongW@8]


                    section .data

__imp__GetWindowLongW@8:   dd unicows_initial_stub_GetWindowLongW
_Unicows_GetWindowLongW:      dd 0
namestring_GetWindowLongW:    db 'GetWindowLongW',0
