%include "dll_names.inc"

                    global __imp__SetPropA@12
                    global _SetPropA@12
                    global _Unicows_SetPropA
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetPropA:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetPropA@12     ; place to save the pointer
                    push dword [_Unicows_SetPropA]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetPropA      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetPropA@12]

_SetPropA@12:
                    jmp [__imp__SetPropA@12]


                    section .data

__imp__SetPropA@12:   dd unicows_initial_stub_SetPropA
_Unicows_SetPropA:      dd 0
namestring_SetPropA:    db 'SetPropA',0
