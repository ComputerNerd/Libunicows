%include "dll_names.inc"

                    global __imp__GetStringTypeW@16
                    global _GetStringTypeW@16
                    global _Unicows_GetStringTypeW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetStringTypeW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetStringTypeW@16     ; place to save the pointer
                    push dword [_Unicows_GetStringTypeW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetStringTypeW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetStringTypeW@16]

_GetStringTypeW@16:
                    jmp [__imp__GetStringTypeW@16]


                    section .data

__imp__GetStringTypeW@16:   dd unicows_initial_stub_GetStringTypeW
_Unicows_GetStringTypeW:      dd 0
namestring_GetStringTypeW:    db 'GetStringTypeW',0
