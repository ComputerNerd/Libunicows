%include "dll_names.inc"

                    global __imp__SetEnvironmentVariableW@8
                    global _SetEnvironmentVariableW@8
                    global _Unicows_SetEnvironmentVariableW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetEnvironmentVariableW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetEnvironmentVariableW@8     ; place to save the pointer
                    push dword [_Unicows_SetEnvironmentVariableW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SetEnvironmentVariableW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetEnvironmentVariableW@8]

_SetEnvironmentVariableW@8:
                    jmp [__imp__SetEnvironmentVariableW@8]


                    section .data

__imp__SetEnvironmentVariableW@8:   dd unicows_initial_stub_SetEnvironmentVariableW
_Unicows_SetEnvironmentVariableW:      dd 0
namestring_SetEnvironmentVariableW:    db 'SetEnvironmentVariableW',0
