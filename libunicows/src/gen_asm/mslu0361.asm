%include "dll_names.inc"

                    global __imp__GetStringTypeExW@20
                    global _GetStringTypeExW@20
                    global _Unicows_GetStringTypeExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetStringTypeExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetStringTypeExW@20     ; place to save the pointer
                    push dword [_Unicows_GetStringTypeExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetStringTypeExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetStringTypeExW@20]

_GetStringTypeExW@20:
                    jmp [__imp__GetStringTypeExW@20]


                    section .data

__imp__GetStringTypeExW@20:   dd unicows_initial_stub_GetStringTypeExW
_Unicows_GetStringTypeExW:      dd 0
namestring_GetStringTypeExW:    db 'GetStringTypeExW',0