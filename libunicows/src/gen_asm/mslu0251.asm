%include "dll_names.inc"

                    global __imp__VerInstallFileW@32
                    global _VerInstallFileW@32
                    global _Unicows_VerInstallFileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_VerInstallFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__VerInstallFileW@32     ; place to save the pointer
                    push dword [_Unicows_VerInstallFileW]      ; default proc, if any
                    push dword VERSION                  ; dll id
                    push dword namestring_VerInstallFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__VerInstallFileW@32]

_VerInstallFileW@32:
                    jmp [__imp__VerInstallFileW@32]


                    section .data

__imp__VerInstallFileW@32:   dd unicows_initial_stub_VerInstallFileW
_Unicows_VerInstallFileW:      dd 0
namestring_VerInstallFileW:    db 'VerInstallFileW',0