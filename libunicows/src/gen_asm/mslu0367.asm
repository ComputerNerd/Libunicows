%include "dll_names.inc"

                    global __imp__GetVersionExW@4
                    global _GetVersionExW@4
                    global _Unicows_GetVersionExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetVersionExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetVersionExW@4     ; place to save the pointer
                    push dword [_Unicows_GetVersionExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetVersionExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetVersionExW@4]

_GetVersionExW@4:
                    jmp [__imp__GetVersionExW@4]


                    section .data

__imp__GetVersionExW@4:   dd unicows_initial_stub_GetVersionExW
_Unicows_GetVersionExW:      dd 0
namestring_GetVersionExW:    db 'GetVersionExW',0
