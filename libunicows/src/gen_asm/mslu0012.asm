%include "dll_names.inc"

                    global __imp__WNetGetNetworkInformationW@8
                    global _WNetGetNetworkInformationW@8
                    global _Unicows_WNetGetNetworkInformationW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetGetNetworkInformationW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetNetworkInformationW@8     ; place to save the pointer
                    push dword [_Unicows_WNetGetNetworkInformationW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetNetworkInformationW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetGetNetworkInformationW@8]

_WNetGetNetworkInformationW@8:
                    jmp [__imp__WNetGetNetworkInformationW@8]


                    section .data

__imp__WNetGetNetworkInformationW@8:   dd unicows_initial_stub_WNetGetNetworkInformationW
_Unicows_WNetGetNetworkInformationW:      dd 0
namestring_WNetGetNetworkInformationW:    db 'WNetGetNetworkInformationW',0
