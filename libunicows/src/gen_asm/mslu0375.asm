%include "dll_names.inc"

                    global __imp__LCMapStringW@24
                    global _LCMapStringW@24
                    global _Unicows_LCMapStringW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_LCMapStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LCMapStringW@24     ; place to save the pointer
                    push dword [_Unicows_LCMapStringW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_LCMapStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__LCMapStringW@24]

_LCMapStringW@24:
                    jmp [__imp__LCMapStringW@24]


                    section .data

__imp__LCMapStringW@24:   dd unicows_initial_stub_LCMapStringW
_Unicows_LCMapStringW:      dd 0
namestring_LCMapStringW:    db 'LCMapStringW',0
