%include "dll_names.inc"

                    global __imp__GetTempFileNameW@16
                    global _GetTempFileNameW@16
                    global _Unicows_GetTempFileNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetTempFileNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTempFileNameW@16     ; place to save the pointer
                    push dword [_Unicows_GetTempFileNameW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetTempFileNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetTempFileNameW@16]

_GetTempFileNameW@16:
                    jmp [__imp__GetTempFileNameW@16]


                    section .data

__imp__GetTempFileNameW@16:   dd unicows_initial_stub_GetTempFileNameW
_Unicows_GetTempFileNameW:      dd 0
namestring_GetTempFileNameW:    db 'GetTempFileNameW',0
