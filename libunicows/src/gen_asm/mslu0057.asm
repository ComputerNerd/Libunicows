%include "dll_names.inc"

                    global __imp__ResetDCW@8
                    global _ResetDCW@8
                    global _Unicows_ResetDCW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ResetDCW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ResetDCW@8     ; place to save the pointer
                    push dword [_Unicows_ResetDCW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_ResetDCW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ResetDCW@8]

_ResetDCW@8:
                    jmp [__imp__ResetDCW@8]


                    section .data

__imp__ResetDCW@8:   dd unicows_initial_stub_ResetDCW
_Unicows_ResetDCW:      dd 0
namestring_ResetDCW:    db 'ResetDCW',0
