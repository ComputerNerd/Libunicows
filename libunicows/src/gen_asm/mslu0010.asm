%include "dll_names.inc"

                    global __imp__WNetGetConnectionW@12
                    global _WNetGetConnectionW@12
                    global _Unicows_WNetGetConnectionW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetGetConnectionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetConnectionW@12     ; place to save the pointer
                    push dword [_Unicows_WNetGetConnectionW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetConnectionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetGetConnectionW@12]

_WNetGetConnectionW@12:
                    jmp [__imp__WNetGetConnectionW@12]


                    section .data

__imp__WNetGetConnectionW@12:   dd unicows_initial_stub_WNetGetConnectionW
_Unicows_WNetGetConnectionW:      dd 0
namestring_WNetGetConnectionW:    db 'WNetGetConnectionW',0
