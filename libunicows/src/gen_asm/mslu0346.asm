%include "dll_names.inc"

                    global __imp__GetFullPathNameW@16
                    global _GetFullPathNameW@16
                    global _Unicows_GetFullPathNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetFullPathNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetFullPathNameW@16     ; place to save the pointer
                    push dword [_Unicows_GetFullPathNameW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetFullPathNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetFullPathNameW@16]

_GetFullPathNameW@16:
                    jmp [__imp__GetFullPathNameW@16]


                    section .data

__imp__GetFullPathNameW@16:   dd unicows_initial_stub_GetFullPathNameW
_Unicows_GetFullPathNameW:      dd 0
namestring_GetFullPathNameW:    db 'GetFullPathNameW',0
