%include "dll_names.inc"

                    global __imp__RemovePropA@8
                    global _RemovePropA@8
                    global _Unicows_RemovePropA
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RemovePropA:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RemovePropA@8     ; place to save the pointer
                    push dword [_Unicows_RemovePropA]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_RemovePropA      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RemovePropA@8]

_RemovePropA@8:
                    jmp [__imp__RemovePropA@8]


                    section .data

__imp__RemovePropA@8:   dd unicows_initial_stub_RemovePropA
_Unicows_RemovePropA:      dd 0
namestring_RemovePropA:    db 'RemovePropA',0
