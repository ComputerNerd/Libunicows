%include "dll_names.inc"

                    global __imp__VerQueryValueW@16
                    global _VerQueryValueW@16
                    global _Unicows_VerQueryValueW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_VerQueryValueW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__VerQueryValueW@16     ; place to save the pointer
                    push dword [_Unicows_VerQueryValueW]      ; default proc, if any
                    push dword VERSION                  ; dll id
                    push dword namestring_VerQueryValueW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__VerQueryValueW@16]

_VerQueryValueW@16:
                    jmp [__imp__VerQueryValueW@16]


                    section .data

__imp__VerQueryValueW@16:   dd unicows_initial_stub_VerQueryValueW
_Unicows_VerQueryValueW:      dd 0
namestring_VerQueryValueW:    db 'VerQueryValueW',0
