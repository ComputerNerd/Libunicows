%include "dll_names.inc"

                    global __imp__WNetUseConnectionW@32
                    global _WNetUseConnectionW@32
                    global _Unicows_WNetUseConnectionW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetUseConnectionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetUseConnectionW@32     ; place to save the pointer
                    push dword [_Unicows_WNetUseConnectionW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetUseConnectionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetUseConnectionW@32]

_WNetUseConnectionW@32:
                    jmp [__imp__WNetUseConnectionW@32]


                    section .data

__imp__WNetUseConnectionW@32:   dd unicows_initial_stub_WNetUseConnectionW
_Unicows_WNetUseConnectionW:      dd 0
namestring_WNetUseConnectionW:    db 'WNetUseConnectionW',0
