%include "dll_names.inc"

                    global __imp__RasGetConnectStatusW@8
                    global _RasGetConnectStatusW@8
                    global _Unicows_RasGetConnectStatusW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasGetConnectStatusW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasGetConnectStatusW@8     ; place to save the pointer
                    push dword [_Unicows_RasGetConnectStatusW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasGetConnectStatusW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasGetConnectStatusW@8]

_RasGetConnectStatusW@8:
                    jmp [__imp__RasGetConnectStatusW@8]


                    section .data

__imp__RasGetConnectStatusW@8:   dd unicows_initial_stub_RasGetConnectStatusW
_Unicows_RasGetConnectStatusW:      dd 0
namestring_RasGetConnectStatusW:    db 'RasGetConnectStatusW',0
