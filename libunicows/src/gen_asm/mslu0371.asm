%include "dll_names.inc"

                    global __imp__GlobalFindAtomW@4
                    global _GlobalFindAtomW@4
                    global _Unicows_GlobalFindAtomW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GlobalFindAtomW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GlobalFindAtomW@4     ; place to save the pointer
                    push dword [_Unicows_GlobalFindAtomW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GlobalFindAtomW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GlobalFindAtomW@4]

_GlobalFindAtomW@4:
                    jmp [__imp__GlobalFindAtomW@4]


                    section .data

__imp__GlobalFindAtomW@4:   dd unicows_initial_stub_GlobalFindAtomW
_Unicows_GlobalFindAtomW:      dd 0
namestring_GlobalFindAtomW:    db 'GlobalFindAtomW',0
