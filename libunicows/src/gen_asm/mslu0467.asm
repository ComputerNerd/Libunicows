%include "dll_names.inc"

                    global __imp__GetJobW@24
                    global _GetJobW@24
                    global _Unicows_GetJobW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetJobW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetJobW@24     ; place to save the pointer
                    push dword [_Unicows_GetJobW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_GetJobW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetJobW@24]

_GetJobW@24:
                    jmp [__imp__GetJobW@24]


                    section .data

__imp__GetJobW@24:   dd unicows_initial_stub_GetJobW
_Unicows_GetJobW:      dd 0
namestring_GetJobW:    db 'GetJobW',0
