%include "dll_names.inc"

                    global __imp__CreateFileW@28
                    global _CreateFileW@28
                    global _Unicows_CreateFileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateFileW@28     ; place to save the pointer
                    push dword [_Unicows_CreateFileW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateFileW@28]

_CreateFileW@28:
                    jmp [__imp__CreateFileW@28]


                    section .data

__imp__CreateFileW@28:   dd unicows_initial_stub_CreateFileW
_Unicows_CreateFileW:      dd 0
namestring_CreateFileW:    db 'CreateFileW',0
