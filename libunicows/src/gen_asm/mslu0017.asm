%include "dll_names.inc"

                    global __imp__WNetGetUserW@12
                    global _WNetGetUserW@12
                    global _Unicows_WNetGetUserW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetGetUserW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetUserW@12     ; place to save the pointer
                    push dword [_Unicows_WNetGetUserW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetUserW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetGetUserW@12]

_WNetGetUserW@12:
                    jmp [__imp__WNetGetUserW@12]


                    section .data

__imp__WNetGetUserW@12:   dd unicows_initial_stub_WNetGetUserW
_Unicows_WNetGetUserW:      dd 0
namestring_WNetGetUserW:    db 'WNetGetUserW',0
