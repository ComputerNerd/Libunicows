%include "dll_names.inc"

                    global __imp__InitSecurityInterfaceW@0
                    global _InitSecurityInterfaceW@0
                    global _Unicows_InitSecurityInterfaceW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_InitSecurityInterfaceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__InitSecurityInterfaceW@0     ; place to save the pointer
                    push dword [_Unicows_InitSecurityInterfaceW]      ; default proc, if any
                    push dword SECUR32                  ; dll id
                    push dword namestring_InitSecurityInterfaceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__InitSecurityInterfaceW@0]

_InitSecurityInterfaceW@0:
                    jmp [__imp__InitSecurityInterfaceW@0]


                    section .data

__imp__InitSecurityInterfaceW@0:   dd unicows_initial_stub_InitSecurityInterfaceW
_Unicows_InitSecurityInterfaceW:      dd 0
namestring_InitSecurityInterfaceW:    db 'InitSecurityInterfaceW',0
