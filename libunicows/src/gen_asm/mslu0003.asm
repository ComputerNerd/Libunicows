%include "dll_names.inc"

                    global __imp__WNetAddConnection3W@20
                    global _WNetAddConnection3W@20
                    global _Unicows_WNetAddConnection3W
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetAddConnection3W:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetAddConnection3W@20     ; place to save the pointer
                    push dword [_Unicows_WNetAddConnection3W]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetAddConnection3W      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetAddConnection3W@20]

_WNetAddConnection3W@20:
                    jmp [__imp__WNetAddConnection3W@20]


                    section .data

__imp__WNetAddConnection3W@20:   dd unicows_initial_stub_WNetAddConnection3W
_Unicows_WNetAddConnection3W:      dd 0
namestring_WNetAddConnection3W:    db 'WNetAddConnection3W',0
