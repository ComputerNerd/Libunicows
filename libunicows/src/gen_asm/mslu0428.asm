%include "dll_names.inc"

                    global __imp__RasEnumDevicesW@12
                    global _RasEnumDevicesW@12
                    global _Unicows_RasEnumDevicesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasEnumDevicesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasEnumDevicesW@12     ; place to save the pointer
                    push dword [_Unicows_RasEnumDevicesW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasEnumDevicesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasEnumDevicesW@12]

_RasEnumDevicesW@12:
                    jmp [__imp__RasEnumDevicesW@12]


                    section .data

__imp__RasEnumDevicesW@12:   dd unicows_initial_stub_RasEnumDevicesW
_Unicows_RasEnumDevicesW:      dd 0
namestring_RasEnumDevicesW:    db 'RasEnumDevicesW',0
