%include "dll_names.inc"

                    global __imp__MoveFileW@8
                    global _MoveFileW@8
                    global _Unicows_MoveFileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_MoveFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MoveFileW@8     ; place to save the pointer
                    push dword [_Unicows_MoveFileW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_MoveFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__MoveFileW@8]

_MoveFileW@8:
                    jmp [__imp__MoveFileW@8]


                    section .data

__imp__MoveFileW@8:   dd unicows_initial_stub_MoveFileW
_Unicows_MoveFileW:      dd 0
namestring_MoveFileW:    db 'MoveFileW',0
