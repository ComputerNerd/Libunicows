%include "dll_names.inc"

                    global __imp__OpenEventW@12
                    global _OpenEventW@12
                    global _Unicows_OpenEventW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OpenEventW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OpenEventW@12     ; place to save the pointer
                    push dword [_Unicows_OpenEventW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_OpenEventW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OpenEventW@12]

_OpenEventW@12:
                    jmp [__imp__OpenEventW@12]


                    section .data

__imp__OpenEventW@12:   dd unicows_initial_stub_OpenEventW
_Unicows_OpenEventW:      dd 0
namestring_OpenEventW:    db 'OpenEventW',0
