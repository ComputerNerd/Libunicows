%include "dll_names.inc"

                    global __imp__CreateAcceleratorTableW@8
                    global _CreateAcceleratorTableW@8
                    global _Unicows_CreateAcceleratorTableW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateAcceleratorTableW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateAcceleratorTableW@8     ; place to save the pointer
                    push dword [_Unicows_CreateAcceleratorTableW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CreateAcceleratorTableW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateAcceleratorTableW@8]

_CreateAcceleratorTableW@8:
                    jmp [__imp__CreateAcceleratorTableW@8]


                    section .data

__imp__CreateAcceleratorTableW@8:   dd unicows_initial_stub_CreateAcceleratorTableW
_Unicows_CreateAcceleratorTableW:      dd 0
namestring_CreateAcceleratorTableW:    db 'CreateAcceleratorTableW',0
