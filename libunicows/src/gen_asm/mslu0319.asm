%include "dll_names.inc"

                    global __imp__FindFirstChangeNotificationW@12
                    global _FindFirstChangeNotificationW@12
                    global _Unicows_FindFirstChangeNotificationW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_FindFirstChangeNotificationW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindFirstChangeNotificationW@12     ; place to save the pointer
                    push dword [_Unicows_FindFirstChangeNotificationW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_FindFirstChangeNotificationW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__FindFirstChangeNotificationW@12]

_FindFirstChangeNotificationW@12:
                    jmp [__imp__FindFirstChangeNotificationW@12]


                    section .data

__imp__FindFirstChangeNotificationW@12:   dd unicows_initial_stub_FindFirstChangeNotificationW
_Unicows_FindFirstChangeNotificationW:      dd 0
namestring_FindFirstChangeNotificationW:    db 'FindFirstChangeNotificationW',0
