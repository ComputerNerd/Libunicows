%include "dll_names.inc"

                    global __imp__CharUpperW@4
                    global _CharUpperW@4
                    global _Unicows_CharUpperW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CharUpperW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CharUpperW@4     ; place to save the pointer
                    push dword [_Unicows_CharUpperW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CharUpperW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CharUpperW@4]

_CharUpperW@4:
                    jmp [__imp__CharUpperW@4]


                    section .data

__imp__CharUpperW@4:   dd unicows_initial_stub_CharUpperW
_Unicows_CharUpperW:      dd 0
namestring_CharUpperW:    db 'CharUpperW',0
