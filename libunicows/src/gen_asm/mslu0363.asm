%include "dll_names.inc"

                    global __imp__GetStartupInfoW@4
                    global _GetStartupInfoW@4
                    global _Unicows_GetStartupInfoW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetStartupInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetStartupInfoW@4     ; place to save the pointer
                    push dword [_Unicows_GetStartupInfoW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetStartupInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetStartupInfoW@4]

_GetStartupInfoW@4:
                    jmp [__imp__GetStartupInfoW@4]


                    section .data

__imp__GetStartupInfoW@4:   dd unicows_initial_stub_GetStartupInfoW
_Unicows_GetStartupInfoW:      dd 0
namestring_GetStartupInfoW:    db 'GetStartupInfoW',0
