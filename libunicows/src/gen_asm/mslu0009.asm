%include "dll_names.inc"

                    global __imp__WNetEnumResourceW@16
                    global _WNetEnumResourceW@16
                    global _Unicows_WNetEnumResourceW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WNetEnumResourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetEnumResourceW@16     ; place to save the pointer
                    push dword [_Unicows_WNetEnumResourceW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetEnumResourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WNetEnumResourceW@16]

_WNetEnumResourceW@16:
                    jmp [__imp__WNetEnumResourceW@16]


                    section .data

__imp__WNetEnumResourceW@16:   dd unicows_initial_stub_WNetEnumResourceW
_Unicows_WNetEnumResourceW:      dd 0
namestring_WNetEnumResourceW:    db 'WNetEnumResourceW',0
