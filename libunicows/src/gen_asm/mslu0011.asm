%include "dll_names.inc"

                    global __imp__WNetGetLastErrorW@20
                    global _WNetGetLastErrorW@20
                    global _Unicows_WNetGetLastErrorW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetGetLastErrorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetLastErrorW@20     ; place to save the pointer
                    push dword [_Unicows_WNetGetLastErrorW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetLastErrorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetGetLastErrorW@20]

_WNetGetLastErrorW@20:
                    jmp [__imp__WNetGetLastErrorW@20]


                    section .data

__imp__WNetGetLastErrorW@20:   dd unicows_initial_stub_WNetGetLastErrorW
_Unicows_WNetGetLastErrorW:      dd 0
namestring_WNetGetLastErrorW:    db 'WNetGetLastErrorW',0
