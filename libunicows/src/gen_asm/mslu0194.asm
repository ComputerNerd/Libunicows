%include "dll_names.inc"

                    global __imp__LoadStringW@16
                    global _LoadStringW@16
                    global _Unicows_LoadStringW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_LoadStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadStringW@16     ; place to save the pointer
                    push dword [_Unicows_LoadStringW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__LoadStringW@16]

_LoadStringW@16:
                    jmp [__imp__LoadStringW@16]


                    section .data

__imp__LoadStringW@16:   dd unicows_initial_stub_LoadStringW
_Unicows_LoadStringW:      dd 0
namestring_LoadStringW:    db 'LoadStringW',0
