%include "dll_names.inc"

                    global __imp__GetDefaultCommConfigW@12
                    global _GetDefaultCommConfigW@12
                    global _Unicows_GetDefaultCommConfigW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetDefaultCommConfigW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetDefaultCommConfigW@12     ; place to save the pointer
                    push dword [_Unicows_GetDefaultCommConfigW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetDefaultCommConfigW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetDefaultCommConfigW@12]

_GetDefaultCommConfigW@12:
                    jmp [__imp__GetDefaultCommConfigW@12]


                    section .data

__imp__GetDefaultCommConfigW@12:   dd unicows_initial_stub_GetDefaultCommConfigW
_Unicows_GetDefaultCommConfigW:      dd 0
namestring_GetDefaultCommConfigW:    db 'GetDefaultCommConfigW',0
