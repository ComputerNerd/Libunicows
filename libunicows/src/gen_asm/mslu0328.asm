%include "dll_names.inc"

                    global __imp__GetCPInfoExW@12
                    global _GetCPInfoExW@12
                    global _Unicows_GetCPInfoExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetCPInfoExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCPInfoExW@12     ; place to save the pointer
                    push dword [_Unicows_GetCPInfoExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetCPInfoExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetCPInfoExW@12]

_GetCPInfoExW@12:
                    jmp [__imp__GetCPInfoExW@12]


                    section .data

__imp__GetCPInfoExW@12:   dd unicows_initial_stub_GetCPInfoExW
_Unicows_GetCPInfoExW:      dd 0
namestring_GetCPInfoExW:    db 'GetCPInfoExW',0
