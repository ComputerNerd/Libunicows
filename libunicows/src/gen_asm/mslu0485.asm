%include "dll_names.inc"

                    global __imp__AcquireCredentialsHandleW@36
                    global _AcquireCredentialsHandleW@36
                    global _Unicows_AcquireCredentialsHandleW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_AcquireCredentialsHandleW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AcquireCredentialsHandleW@36     ; place to save the pointer
                    push dword [_Unicows_AcquireCredentialsHandleW]      ; default proc, if any
                    push dword SECUR32                  ; dll id
                    push dword namestring_AcquireCredentialsHandleW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__AcquireCredentialsHandleW@36]

_AcquireCredentialsHandleW@36:
                    jmp [__imp__AcquireCredentialsHandleW@36]


                    section .data

__imp__AcquireCredentialsHandleW@36:   dd unicows_initial_stub_AcquireCredentialsHandleW
_Unicows_AcquireCredentialsHandleW:      dd 0
namestring_AcquireCredentialsHandleW:    db 'AcquireCredentialsHandleW',0
