%include "dll_names.inc"

                    global __imp__OpenSemaphoreW@12
                    global _OpenSemaphoreW@12
                    global _Unicows_OpenSemaphoreW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OpenSemaphoreW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OpenSemaphoreW@12     ; place to save the pointer
                    push dword [_Unicows_OpenSemaphoreW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_OpenSemaphoreW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OpenSemaphoreW@12]

_OpenSemaphoreW@12:
                    jmp [__imp__OpenSemaphoreW@12]


                    section .data

__imp__OpenSemaphoreW@12:   dd unicows_initial_stub_OpenSemaphoreW
_Unicows_OpenSemaphoreW:      dd 0
namestring_OpenSemaphoreW:    db 'OpenSemaphoreW',0
