%include "dll_names.inc"

                    global __imp__DialogBoxParamW@20
                    global _DialogBoxParamW@20
                    global _Unicows_DialogBoxParamW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DialogBoxParamW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DialogBoxParamW@20     ; place to save the pointer
                    push dword [_Unicows_DialogBoxParamW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DialogBoxParamW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DialogBoxParamW@20]

_DialogBoxParamW@20:
                    jmp [__imp__DialogBoxParamW@20]


                    section .data

__imp__DialogBoxParamW@20:   dd unicows_initial_stub_DialogBoxParamW
_Unicows_DialogBoxParamW:      dd 0
namestring_DialogBoxParamW:    db 'DialogBoxParamW',0
