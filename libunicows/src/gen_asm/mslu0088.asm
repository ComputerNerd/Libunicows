%include "dll_names.inc"

                    global __imp__GetStateTextW@12
                    global _GetStateTextW@12
                    global _Unicows_GetStateTextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetStateTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetStateTextW@12     ; place to save the pointer
                    push dword [_Unicows_GetStateTextW]      ; default proc, if any
                    push dword OLEACC                  ; dll id
                    push dword namestring_GetStateTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetStateTextW@12]

_GetStateTextW@12:
                    jmp [__imp__GetStateTextW@12]


                    section .data

__imp__GetStateTextW@12:   dd unicows_initial_stub_GetStateTextW
_Unicows_GetStateTextW:      dd 0
namestring_GetStateTextW:    db 'GetStateTextW',0
