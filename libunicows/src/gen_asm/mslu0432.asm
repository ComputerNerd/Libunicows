%include "dll_names.inc"

                    global __imp__RasEnumConnectionsW@12
                    global _RasEnumConnectionsW@12
                    global _Unicows_RasEnumConnectionsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasEnumConnectionsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasEnumConnectionsW@12     ; place to save the pointer
                    push dword [_Unicows_RasEnumConnectionsW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasEnumConnectionsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasEnumConnectionsW@12]

_RasEnumConnectionsW@12:
                    jmp [__imp__RasEnumConnectionsW@12]


                    section .data

__imp__RasEnumConnectionsW@12:   dd unicows_initial_stub_RasEnumConnectionsW
_Unicows_RasEnumConnectionsW:      dd 0
namestring_RasEnumConnectionsW:    db 'RasEnumConnectionsW',0
