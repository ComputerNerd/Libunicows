%include "dll_names.inc"

                    global __imp__AddMonitorW@12
                    global _AddMonitorW@12
                    global _Unicows_AddMonitorW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_AddMonitorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AddMonitorW@12     ; place to save the pointer
                    push dword [_Unicows_AddMonitorW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_AddMonitorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__AddMonitorW@12]

_AddMonitorW@12:
                    jmp [__imp__AddMonitorW@12]


                    section .data

__imp__AddMonitorW@12:   dd unicows_initial_stub_AddMonitorW
_Unicows_AddMonitorW:      dd 0
namestring_AddMonitorW:    db 'AddMonitorW',0
