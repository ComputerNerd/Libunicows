%include "dll_names.inc"

                    global __imp__CreateDCW@16
                    global _CreateDCW@16
                    global _Unicows_CreateDCW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateDCW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateDCW@16     ; place to save the pointer
                    push dword [_Unicows_CreateDCW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_CreateDCW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateDCW@16]

_CreateDCW@16:
                    jmp [__imp__CreateDCW@16]


                    section .data

__imp__CreateDCW@16:   dd unicows_initial_stub_CreateDCW
_Unicows_CreateDCW:      dd 0
namestring_CreateDCW:    db 'CreateDCW',0
