%include "dll_names.inc"

                    global __imp__ExpandEnvironmentStringsW@12
                    global _ExpandEnvironmentStringsW@12
                    global _Unicows_ExpandEnvironmentStringsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ExpandEnvironmentStringsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ExpandEnvironmentStringsW@12     ; place to save the pointer
                    push dword [_Unicows_ExpandEnvironmentStringsW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_ExpandEnvironmentStringsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ExpandEnvironmentStringsW@12]

_ExpandEnvironmentStringsW@12:
                    jmp [__imp__ExpandEnvironmentStringsW@12]


                    section .data

__imp__ExpandEnvironmentStringsW@12:   dd unicows_initial_stub_ExpandEnvironmentStringsW
_Unicows_ExpandEnvironmentStringsW:      dd 0
namestring_ExpandEnvironmentStringsW:    db 'ExpandEnvironmentStringsW',0
