%include "dll_names.inc"

                    global __imp__OpenMutexW@12
                    global _OpenMutexW@12
                    global _Unicows_OpenMutexW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OpenMutexW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OpenMutexW@12     ; place to save the pointer
                    push dword [_Unicows_OpenMutexW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_OpenMutexW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OpenMutexW@12]

_OpenMutexW@12:
                    jmp [__imp__OpenMutexW@12]


                    section .data

__imp__OpenMutexW@12:   dd unicows_initial_stub_OpenMutexW
_Unicows_OpenMutexW:      dd 0
namestring_OpenMutexW:    db 'OpenMutexW',0
