%include "dll_names.inc"

                    global __imp__WNetGetUniversalNameW@16
                    global _WNetGetUniversalNameW@16
                    global _Unicows_WNetGetUniversalNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetGetUniversalNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetUniversalNameW@16     ; place to save the pointer
                    push dword [_Unicows_WNetGetUniversalNameW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetUniversalNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetGetUniversalNameW@16]

_WNetGetUniversalNameW@16:
                    jmp [__imp__WNetGetUniversalNameW@16]


                    section .data

__imp__WNetGetUniversalNameW@16:   dd unicows_initial_stub_WNetGetUniversalNameW
_Unicows_WNetGetUniversalNameW:      dd 0
namestring_WNetGetUniversalNameW:    db 'WNetGetUniversalNameW',0
