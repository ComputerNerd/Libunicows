%include "dll_names.inc"

                    global __imp__GetPropA@8
                    global _GetPropA@8
                    global _Unicows_GetPropA
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetPropA:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPropA@8     ; place to save the pointer
                    push dword [_Unicows_GetPropA]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetPropA      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetPropA@8]

_GetPropA@8:
                    jmp [__imp__GetPropA@8]


                    section .data

__imp__GetPropA@8:   dd unicows_initial_stub_GetPropA
_Unicows_GetPropA:      dd 0
namestring_GetPropA:    db 'GetPropA',0
