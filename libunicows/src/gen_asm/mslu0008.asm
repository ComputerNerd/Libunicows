%include "dll_names.inc"

                    global __imp__WNetDisconnectDialog1W@4
                    global _WNetDisconnectDialog1W@4
                    global _Unicows_WNetDisconnectDialog1W
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetDisconnectDialog1W:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetDisconnectDialog1W@4     ; place to save the pointer
                    push dword [_Unicows_WNetDisconnectDialog1W]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetDisconnectDialog1W      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetDisconnectDialog1W@4]

_WNetDisconnectDialog1W@4:
                    jmp [__imp__WNetDisconnectDialog1W@4]


                    section .data

__imp__WNetDisconnectDialog1W@4:   dd unicows_initial_stub_WNetDisconnectDialog1W
_Unicows_WNetDisconnectDialog1W:      dd 0
namestring_WNetDisconnectDialog1W:    db 'WNetDisconnectDialog1W',0
