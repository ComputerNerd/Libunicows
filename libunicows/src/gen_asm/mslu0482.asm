%include "dll_names.inc"

                    global __imp__IsDestinationReachableW@8
                    global _IsDestinationReachableW@8
                    global _Unicows_IsDestinationReachableW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_IsDestinationReachableW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsDestinationReachableW@8     ; place to save the pointer
                    push dword [_Unicows_IsDestinationReachableW]      ; default proc, if any
                    push dword SENSAPI                  ; dll id
                    push dword namestring_IsDestinationReachableW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__IsDestinationReachableW@8]

_IsDestinationReachableW@8:
                    jmp [__imp__IsDestinationReachableW@8]


                    section .data

__imp__IsDestinationReachableW@8:   dd unicows_initial_stub_IsDestinationReachableW
_Unicows_IsDestinationReachableW:      dd 0
namestring_IsDestinationReachableW:    db 'IsDestinationReachableW',0
