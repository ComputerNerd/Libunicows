%include "dll_names.inc"

                    global __imp__StartDocW@8
                    global _StartDocW@8
                    global _Unicows_StartDocW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_StartDocW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__StartDocW@8     ; place to save the pointer
                    push dword [_Unicows_StartDocW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_StartDocW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__StartDocW@8]

_StartDocW@8:
                    jmp [__imp__StartDocW@8]


                    section .data

__imp__StartDocW@8:   dd unicows_initial_stub_StartDocW
_Unicows_StartDocW:      dd 0
namestring_StartDocW:    db 'StartDocW',0
