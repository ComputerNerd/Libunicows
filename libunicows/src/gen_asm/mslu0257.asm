%include "dll_names.inc"

                    global __imp__GetCurrentHwProfileW@4
                    global _GetCurrentHwProfileW@4
                    global _Unicows_GetCurrentHwProfileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetCurrentHwProfileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCurrentHwProfileW@4     ; place to save the pointer
                    push dword [_Unicows_GetCurrentHwProfileW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_GetCurrentHwProfileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetCurrentHwProfileW@4]

_GetCurrentHwProfileW@4:
                    jmp [__imp__GetCurrentHwProfileW@4]


                    section .data

__imp__GetCurrentHwProfileW@4:   dd unicows_initial_stub_GetCurrentHwProfileW
_Unicows_GetCurrentHwProfileW:      dd 0
namestring_GetCurrentHwProfileW:    db 'GetCurrentHwProfileW',0
