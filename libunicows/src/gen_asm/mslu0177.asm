%include "dll_names.inc"

                    global __imp__IsCharLowerW@4
                    global _IsCharLowerW@4
                    global _Unicows_IsCharLowerW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_IsCharLowerW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsCharLowerW@4     ; place to save the pointer
                    push dword [_Unicows_IsCharLowerW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_IsCharLowerW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__IsCharLowerW@4]

_IsCharLowerW@4:
                    jmp [__imp__IsCharLowerW@4]


                    section .data

__imp__IsCharLowerW@4:   dd unicows_initial_stub_IsCharLowerW
_Unicows_IsCharLowerW:      dd 0
namestring_IsCharLowerW:    db 'IsCharLowerW',0
