%include "dll_names.inc"

                    global __imp__InitializeSecurityContextW@48
                    global _InitializeSecurityContextW@48
                    global _Unicows_InitializeSecurityContextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_InitializeSecurityContextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__InitializeSecurityContextW@48     ; place to save the pointer
                    push dword [_Unicows_InitializeSecurityContextW]      ; default proc, if any
                    push dword SECUR32                  ; dll id
                    push dword namestring_InitializeSecurityContextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__InitializeSecurityContextW@48]

_InitializeSecurityContextW@48:
                    jmp [__imp__InitializeSecurityContextW@48]


                    section .data

__imp__InitializeSecurityContextW@48:   dd unicows_initial_stub_InitializeSecurityContextW
_Unicows_InitializeSecurityContextW:      dd 0
namestring_InitializeSecurityContextW:    db 'InitializeSecurityContextW',0
