%include "dll_names.inc"

                    global __imp__WNetCancelConnectionW@8
                    global _WNetCancelConnectionW@8
                    global _Unicows_WNetCancelConnectionW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetCancelConnectionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetCancelConnectionW@8     ; place to save the pointer
                    push dword [_Unicows_WNetCancelConnectionW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetCancelConnectionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetCancelConnectionW@8]

_WNetCancelConnectionW@8:
                    jmp [__imp__WNetCancelConnectionW@8]


                    section .data

__imp__WNetCancelConnectionW@8:   dd unicows_initial_stub_WNetCancelConnectionW
_Unicows_WNetCancelConnectionW:      dd 0
namestring_WNetCancelConnectionW:    db 'WNetCancelConnectionW',0
