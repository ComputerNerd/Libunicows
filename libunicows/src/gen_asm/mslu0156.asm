%include "dll_names.inc"

                    global __imp__GetClassLongW@8
                    global _GetClassLongW@8
                    global _Unicows_GetClassLongW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetClassLongW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetClassLongW@8     ; place to save the pointer
                    push dword [_Unicows_GetClassLongW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetClassLongW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetClassLongW@8]

_GetClassLongW@8:
                    jmp [__imp__GetClassLongW@8]


                    section .data

__imp__GetClassLongW@8:   dd unicows_initial_stub_GetClassLongW
_Unicows_GetClassLongW:      dd 0
namestring_GetClassLongW:    db 'GetClassLongW',0
