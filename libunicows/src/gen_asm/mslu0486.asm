%include "dll_names.inc"

                    global __imp__EnumerateSecurityPackagesW@8
                    global _EnumerateSecurityPackagesW@8
                    global _Unicows_EnumerateSecurityPackagesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumerateSecurityPackagesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumerateSecurityPackagesW@8     ; place to save the pointer
                    push dword [_Unicows_EnumerateSecurityPackagesW]      ; default proc, if any
                    push dword SECUR32                  ; dll id
                    push dword namestring_EnumerateSecurityPackagesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumerateSecurityPackagesW@8]

_EnumerateSecurityPackagesW@8:
                    jmp [__imp__EnumerateSecurityPackagesW@8]


                    section .data

__imp__EnumerateSecurityPackagesW@8:   dd unicows_initial_stub_EnumerateSecurityPackagesW
_Unicows_EnumerateSecurityPackagesW:      dd 0
namestring_EnumerateSecurityPackagesW:    db 'EnumerateSecurityPackagesW',0
