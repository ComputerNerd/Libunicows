%include "dll_names.inc"

                    global __imp__GetTempPathW@8
                    global _GetTempPathW@8
                    global _Unicows_GetTempPathW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetTempPathW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTempPathW@8     ; place to save the pointer
                    push dword [_Unicows_GetTempPathW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetTempPathW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetTempPathW@8]

_GetTempPathW@8:
                    jmp [__imp__GetTempPathW@8]


                    section .data

__imp__GetTempPathW@8:   dd unicows_initial_stub_GetTempPathW
_Unicows_GetTempPathW:      dd 0
namestring_GetTempPathW:    db 'GetTempPathW',0
