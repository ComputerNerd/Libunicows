%include "dll_names.inc"

                    global __imp__WNetGetProviderNameW@12
                    global _WNetGetProviderNameW@12
                    global _Unicows_WNetGetProviderNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetGetProviderNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetProviderNameW@12     ; place to save the pointer
                    push dword [_Unicows_WNetGetProviderNameW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetProviderNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetGetProviderNameW@12]

_WNetGetProviderNameW@12:
                    jmp [__imp__WNetGetProviderNameW@12]


                    section .data

__imp__WNetGetProviderNameW@12:   dd unicows_initial_stub_WNetGetProviderNameW
_Unicows_WNetGetProviderNameW:      dd 0
namestring_WNetGetProviderNameW:    db 'WNetGetProviderNameW',0
