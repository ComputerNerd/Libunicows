%include "dll_names.inc"

                    global __imp__WriteProfileStringW@12
                    global _WriteProfileStringW@12
                    global _Unicows_WriteProfileStringW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WriteProfileStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WriteProfileStringW@12     ; place to save the pointer
                    push dword [_Unicows_WriteProfileStringW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WriteProfileStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WriteProfileStringW@12]

_WriteProfileStringW@12:
                    jmp [__imp__WriteProfileStringW@12]


                    section .data

__imp__WriteProfileStringW@12:   dd unicows_initial_stub_WriteProfileStringW
_Unicows_WriteProfileStringW:      dd 0
namestring_WriteProfileStringW:    db 'WriteProfileStringW',0
