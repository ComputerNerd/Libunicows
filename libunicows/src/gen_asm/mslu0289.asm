%include "dll_names.inc"

                    global __imp__BuildCommDCBW@8
                    global _BuildCommDCBW@8
                    global _Unicows_BuildCommDCBW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_BuildCommDCBW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__BuildCommDCBW@8     ; place to save the pointer
                    push dword [_Unicows_BuildCommDCBW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_BuildCommDCBW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__BuildCommDCBW@8]

_BuildCommDCBW@8:
                    jmp [__imp__BuildCommDCBW@8]


                    section .data

__imp__BuildCommDCBW@8:   dd unicows_initial_stub_BuildCommDCBW
_Unicows_BuildCommDCBW:      dd 0
namestring_BuildCommDCBW:    db 'BuildCommDCBW',0
