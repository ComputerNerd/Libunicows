%include "dll_names.inc"

                    global __imp__AddJobW@20
                    global _AddJobW@20
                    global _Unicows_AddJobW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_AddJobW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AddJobW@20     ; place to save the pointer
                    push dword [_Unicows_AddJobW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_AddJobW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__AddJobW@20]

_AddJobW@20:
                    jmp [__imp__AddJobW@20]


                    section .data

__imp__AddJobW@20:   dd unicows_initial_stub_AddJobW
_Unicows_AddJobW:      dd 0
namestring_AddJobW:    db 'AddJobW',0
