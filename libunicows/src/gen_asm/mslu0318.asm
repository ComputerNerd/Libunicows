%include "dll_names.inc"

                    global __imp__FindAtomW@4
                    global _FindAtomW@4
                    global _Unicows_FindAtomW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_FindAtomW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindAtomW@4     ; place to save the pointer
                    push dword [_Unicows_FindAtomW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_FindAtomW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__FindAtomW@4]

_FindAtomW@4:
                    jmp [__imp__FindAtomW@4]


                    section .data

__imp__FindAtomW@4:   dd unicows_initial_stub_FindAtomW
_Unicows_FindAtomW:      dd 0
namestring_FindAtomW:    db 'FindAtomW',0
