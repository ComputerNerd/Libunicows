%include "dll_names.inc"

                    global __imp__GetMonitorInfoW@8
                    global _GetMonitorInfoW@8
                    global _Unicows_GetMonitorInfoW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetMonitorInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetMonitorInfoW@8     ; place to save the pointer
                    push dword [_Unicows_GetMonitorInfoW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetMonitorInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetMonitorInfoW@8]

_GetMonitorInfoW@8:
                    jmp [__imp__GetMonitorInfoW@8]


                    section .data

__imp__GetMonitorInfoW@8:   dd unicows_initial_stub_GetMonitorInfoW
_Unicows_GetMonitorInfoW:      dd 0
namestring_GetMonitorInfoW:    db 'GetMonitorInfoW',0
