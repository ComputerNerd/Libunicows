%include "dll_names.inc"

                    global __imp__GetEnvironmentStringsW@0
                    global _GetEnvironmentStringsW@0
                    global _Unicows_GetEnvironmentStringsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetEnvironmentStringsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetEnvironmentStringsW@0     ; place to save the pointer
                    push dword [_Unicows_GetEnvironmentStringsW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetEnvironmentStringsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetEnvironmentStringsW@0]

_GetEnvironmentStringsW@0:
                    jmp [__imp__GetEnvironmentStringsW@0]


                    section .data

__imp__GetEnvironmentStringsW@0:   dd unicows_initial_stub_GetEnvironmentStringsW
_Unicows_GetEnvironmentStringsW:      dd 0
namestring_GetEnvironmentStringsW:    db 'GetEnvironmentStringsW',0
