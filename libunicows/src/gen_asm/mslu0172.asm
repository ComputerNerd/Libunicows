%include "dll_names.inc"

                    global __imp__GrayStringW@36
                    global _GrayStringW@36
                    global _Unicows_GrayStringW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GrayStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GrayStringW@36     ; place to save the pointer
                    push dword [_Unicows_GrayStringW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GrayStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GrayStringW@36]

_GrayStringW@36:
                    jmp [__imp__GrayStringW@36]


                    section .data

__imp__GrayStringW@36:   dd unicows_initial_stub_GrayStringW
_Unicows_GrayStringW:      dd 0
namestring_GrayStringW:    db 'GrayStringW',0
