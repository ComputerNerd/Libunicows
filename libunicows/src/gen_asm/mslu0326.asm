%include "dll_names.inc"

                    global __imp__GetAtomNameW@12
                    global _GetAtomNameW@12
                    global _Unicows_GetAtomNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetAtomNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetAtomNameW@12     ; place to save the pointer
                    push dword [_Unicows_GetAtomNameW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetAtomNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetAtomNameW@12]

_GetAtomNameW@12:
                    jmp [__imp__GetAtomNameW@12]


                    section .data

__imp__GetAtomNameW@12:   dd unicows_initial_stub_GetAtomNameW
_Unicows_GetAtomNameW:      dd 0
namestring_GetAtomNameW:    db 'GetAtomNameW',0
