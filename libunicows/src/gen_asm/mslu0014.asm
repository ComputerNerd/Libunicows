%include "dll_names.inc"

                    global __imp__WNetGetResourceInformationW@16
                    global _WNetGetResourceInformationW@16
                    global _Unicows_WNetGetResourceInformationW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetGetResourceInformationW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetResourceInformationW@16     ; place to save the pointer
                    push dword [_Unicows_WNetGetResourceInformationW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetResourceInformationW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetGetResourceInformationW@16]

_WNetGetResourceInformationW@16:
                    jmp [__imp__WNetGetResourceInformationW@16]


                    section .data

__imp__WNetGetResourceInformationW@16:   dd unicows_initial_stub_WNetGetResourceInformationW
_Unicows_WNetGetResourceInformationW:      dd 0
namestring_WNetGetResourceInformationW:    db 'WNetGetResourceInformationW',0
