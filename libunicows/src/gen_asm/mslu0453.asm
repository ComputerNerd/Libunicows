%include "dll_names.inc"

                    global __imp__ConfigurePortW@12
                    global _ConfigurePortW@12
                    global _Unicows_ConfigurePortW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ConfigurePortW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ConfigurePortW@12     ; place to save the pointer
                    push dword [_Unicows_ConfigurePortW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_ConfigurePortW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ConfigurePortW@12]

_ConfigurePortW@12:
                    jmp [__imp__ConfigurePortW@12]


                    section .data

__imp__ConfigurePortW@12:   dd unicows_initial_stub_ConfigurePortW
_Unicows_ConfigurePortW:      dd 0
namestring_ConfigurePortW:    db 'ConfigurePortW',0
