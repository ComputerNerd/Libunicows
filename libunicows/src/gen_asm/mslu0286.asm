%include "dll_names.inc"

                    global __imp__AddAtomW@4
                    global _AddAtomW@4
                    global _Unicows_AddAtomW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_AddAtomW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AddAtomW@4     ; place to save the pointer
                    push dword [_Unicows_AddAtomW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_AddAtomW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__AddAtomW@4]

_AddAtomW@4:
                    jmp [__imp__AddAtomW@4]


                    section .data

__imp__AddAtomW@4:   dd unicows_initial_stub_AddAtomW
_Unicows_AddAtomW:      dd 0
namestring_AddAtomW:    db 'AddAtomW',0
