%include "dll_names.inc"

                    global __imp__RasDialW@24
                    global _RasDialW@24
                    global _Unicows_RasDialW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasDialW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasDialW@24     ; place to save the pointer
                    push dword [_Unicows_RasDialW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasDialW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasDialW@24]

_RasDialW@24:
                    jmp [__imp__RasDialW@24]


                    section .data

__imp__RasDialW@24:   dd unicows_initial_stub_RasDialW
_Unicows_RasDialW:      dd 0
namestring_RasDialW:    db 'RasDialW',0
