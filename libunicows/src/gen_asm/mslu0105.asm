%include "dll_names.inc"

                    global __imp__ChangeMenuW@20
                    global _ChangeMenuW@20
                    global _Unicows_ChangeMenuW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ChangeMenuW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ChangeMenuW@20     ; place to save the pointer
                    push dword [_Unicows_ChangeMenuW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_ChangeMenuW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ChangeMenuW@20]

_ChangeMenuW@20:
                    jmp [__imp__ChangeMenuW@20]


                    section .data

__imp__ChangeMenuW@20:   dd unicows_initial_stub_ChangeMenuW
_Unicows_ChangeMenuW:      dd 0
namestring_ChangeMenuW:    db 'ChangeMenuW',0
