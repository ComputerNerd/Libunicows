%include "dll_names.inc"

                    global __imp__QueryCredentialsAttributesW@12
                    global _QueryCredentialsAttributesW@12
                    global _Unicows_QueryCredentialsAttributesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_QueryCredentialsAttributesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__QueryCredentialsAttributesW@12     ; place to save the pointer
                    push dword [_Unicows_QueryCredentialsAttributesW]      ; default proc, if any
                    push dword SECUR32                  ; dll id
                    push dword namestring_QueryCredentialsAttributesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__QueryCredentialsAttributesW@12]

_QueryCredentialsAttributesW@12:
                    jmp [__imp__QueryCredentialsAttributesW@12]


                    section .data

__imp__QueryCredentialsAttributesW@12:   dd unicows_initial_stub_QueryCredentialsAttributesW
_Unicows_QueryCredentialsAttributesW:      dd 0
namestring_QueryCredentialsAttributesW:    db 'QueryCredentialsAttributesW',0