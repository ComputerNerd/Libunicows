%include "dll_names.inc"

                    global __imp__VerFindFileW@32
                    global _VerFindFileW@32
                    global _Unicows_VerFindFileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_VerFindFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__VerFindFileW@32     ; place to save the pointer
                    push dword [_Unicows_VerFindFileW]      ; default proc, if any
                    push dword VERSION                  ; dll id
                    push dword namestring_VerFindFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__VerFindFileW@32]

_VerFindFileW@32:
                    jmp [__imp__VerFindFileW@32]


                    section .data

__imp__VerFindFileW@32:   dd unicows_initial_stub_VerFindFileW
_Unicows_VerFindFileW:      dd 0
namestring_VerFindFileW:    db 'VerFindFileW',0
