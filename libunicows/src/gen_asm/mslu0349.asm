%include "dll_names.inc"

                    global __imp__GetLongPathNameW@12
                    global _GetLongPathNameW@12
                    global _Unicows_GetLongPathNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetLongPathNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetLongPathNameW@12     ; place to save the pointer
                    push dword [_Unicows_GetLongPathNameW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetLongPathNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetLongPathNameW@12]

_GetLongPathNameW@12:
                    jmp [__imp__GetLongPathNameW@12]


                    section .data

__imp__GetLongPathNameW@12:   dd unicows_initial_stub_GetLongPathNameW
_Unicows_GetLongPathNameW:      dd 0
namestring_GetLongPathNameW:    db 'GetLongPathNameW',0
