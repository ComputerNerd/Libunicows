%include "dll_names.inc"

                    global __imp__WNetOpenEnumW@20
                    global _WNetOpenEnumW@20
                    global _Unicows_WNetOpenEnumW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetOpenEnumW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetOpenEnumW@20     ; place to save the pointer
                    push dword [_Unicows_WNetOpenEnumW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetOpenEnumW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetOpenEnumW@20]

_WNetOpenEnumW@20:
                    jmp [__imp__WNetOpenEnumW@20]


                    section .data

__imp__WNetOpenEnumW@20:   dd unicows_initial_stub_WNetOpenEnumW
_Unicows_WNetOpenEnumW:      dd 0
namestring_WNetOpenEnumW:    db 'WNetOpenEnumW',0
