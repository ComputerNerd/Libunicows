%include "dll_names.inc"

                    global __imp__RegConnectRegistryW@12
                    global _RegConnectRegistryW@12
                    global _Unicows_RegConnectRegistryW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegConnectRegistryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegConnectRegistryW@12     ; place to save the pointer
                    push dword [_Unicows_RegConnectRegistryW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegConnectRegistryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegConnectRegistryW@12]

_RegConnectRegistryW@12:
                    jmp [__imp__RegConnectRegistryW@12]


                    section .data

__imp__RegConnectRegistryW@12:   dd unicows_initial_stub_RegConnectRegistryW
_Unicows_RegConnectRegistryW:      dd 0
namestring_RegConnectRegistryW:    db 'RegConnectRegistryW',0
