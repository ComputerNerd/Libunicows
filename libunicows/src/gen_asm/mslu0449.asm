%include "dll_names.inc"

                    global __imp__DeleteMonitorW@12
                    global _DeleteMonitorW@12
                    global _Unicows_DeleteMonitorW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DeleteMonitorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DeleteMonitorW@12     ; place to save the pointer
                    push dword [_Unicows_DeleteMonitorW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_DeleteMonitorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DeleteMonitorW@12]

_DeleteMonitorW@12:
                    jmp [__imp__DeleteMonitorW@12]


                    section .data

__imp__DeleteMonitorW@12:   dd unicows_initial_stub_DeleteMonitorW
_Unicows_DeleteMonitorW:      dd 0
namestring_DeleteMonitorW:    db 'DeleteMonitorW',0
