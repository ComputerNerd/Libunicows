%include "dll_names.inc"

                    global __imp__FormatMessageW@28
                    global _FormatMessageW@28
                    global _Unicows_FormatMessageW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_FormatMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FormatMessageW@28     ; place to save the pointer
                    push dword [_Unicows_FormatMessageW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_FormatMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__FormatMessageW@28]

_FormatMessageW@28:
                    jmp [__imp__FormatMessageW@28]


                    section .data

__imp__FormatMessageW@28:   dd unicows_initial_stub_FormatMessageW
_Unicows_FormatMessageW:      dd 0
namestring_FormatMessageW:    db 'FormatMessageW',0
