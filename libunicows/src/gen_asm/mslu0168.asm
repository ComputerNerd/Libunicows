%include "dll_names.inc"

                    global __imp__GetPropW@8
                    global _GetPropW@8
                    global _Unicows_GetPropW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetPropW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPropW@8     ; place to save the pointer
                    push dword [_Unicows_GetPropW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetPropW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetPropW@8]

_GetPropW@8:
                    jmp [__imp__GetPropW@8]


                    section .data

__imp__GetPropW@8:   dd unicows_initial_stub_GetPropW
_Unicows_GetPropW:      dd 0
namestring_GetPropW:    db 'GetPropW',0
