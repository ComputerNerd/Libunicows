%include "dll_names.inc"

                    global __imp__RasConnectionNotificationW@12
                    global _RasConnectionNotificationW@12
                    global _Unicows_RasConnectionNotificationW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasConnectionNotificationW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasConnectionNotificationW@12     ; place to save the pointer
                    push dword [_Unicows_RasConnectionNotificationW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasConnectionNotificationW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasConnectionNotificationW@12]

_RasConnectionNotificationW@12:
                    jmp [__imp__RasConnectionNotificationW@12]


                    section .data

__imp__RasConnectionNotificationW@12:   dd unicows_initial_stub_RasConnectionNotificationW
_Unicows_RasConnectionNotificationW:      dd 0
namestring_RasConnectionNotificationW:    db 'RasConnectionNotificationW',0
