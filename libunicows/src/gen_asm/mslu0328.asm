%include "dll_names.inc"

                    global __imp__FreeEnvironmentStringsW@4
                    global _FreeEnvironmentStringsW@4
                    global _Unicows_FreeEnvironmentStringsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_FreeEnvironmentStringsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FreeEnvironmentStringsW@4     ; place to save the pointer
                    push dword [_Unicows_FreeEnvironmentStringsW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_FreeEnvironmentStringsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__FreeEnvironmentStringsW@4]

_FreeEnvironmentStringsW@4:
                    jmp [__imp__FreeEnvironmentStringsW@4]


                    section .data

__imp__FreeEnvironmentStringsW@4:   dd unicows_initial_stub_FreeEnvironmentStringsW
_Unicows_FreeEnvironmentStringsW:      dd 0
namestring_FreeEnvironmentStringsW:    db 'FreeEnvironmentStringsW',0
