%include "dll_names.inc"

                    global __imp__RasHangUpW@4
                    global _RasHangUpW@4
                    global _Unicows_RasHangUpW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasHangUpW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasHangUpW@4     ; place to save the pointer
                    push dword [_Unicows_RasHangUpW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasHangUpW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasHangUpW@4]

_RasHangUpW@4:
                    jmp [__imp__RasHangUpW@4]


                    section .data

__imp__RasHangUpW@4:   dd unicows_initial_stub_RasHangUpW
_Unicows_RasHangUpW:      dd 0
namestring_RasHangUpW:    db 'RasHangUpW',0
