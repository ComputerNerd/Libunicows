%include "dll_names.inc"

                    global __imp__LoadAcceleratorsW@8
                    global _LoadAcceleratorsW@8
                    global _Unicows_LoadAcceleratorsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_LoadAcceleratorsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadAcceleratorsW@8     ; place to save the pointer
                    push dword [_Unicows_LoadAcceleratorsW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadAcceleratorsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__LoadAcceleratorsW@8]

_LoadAcceleratorsW@8:
                    jmp [__imp__LoadAcceleratorsW@8]


                    section .data

__imp__LoadAcceleratorsW@8:   dd unicows_initial_stub_LoadAcceleratorsW
_Unicows_LoadAcceleratorsW:      dd 0
namestring_LoadAcceleratorsW:    db 'LoadAcceleratorsW',0
