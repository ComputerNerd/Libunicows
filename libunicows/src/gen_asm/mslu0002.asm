%include "dll_names.inc"

                    global __imp__WNetAddConnection2W@16
                    global _WNetAddConnection2W@16
                    global _Unicows_WNetAddConnection2W
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetAddConnection2W:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetAddConnection2W@16     ; place to save the pointer
                    push dword [_Unicows_WNetAddConnection2W]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetAddConnection2W      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetAddConnection2W@16]

_WNetAddConnection2W@16:
                    jmp [__imp__WNetAddConnection2W@16]


                    section .data

__imp__WNetAddConnection2W@16:   dd unicows_initial_stub_WNetAddConnection2W
_Unicows_WNetAddConnection2W:      dd 0
namestring_WNetAddConnection2W:    db 'WNetAddConnection2W',0
