%include "dll_names.inc"

                    global __imp__CopyAcceleratorTableW@12
                    global _CopyAcceleratorTableW@12
                    global _Unicows_CopyAcceleratorTableW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CopyAcceleratorTableW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CopyAcceleratorTableW@12     ; place to save the pointer
                    push dword [_Unicows_CopyAcceleratorTableW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CopyAcceleratorTableW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CopyAcceleratorTableW@12]

_CopyAcceleratorTableW@12:
                    jmp [__imp__CopyAcceleratorTableW@12]


                    section .data

__imp__CopyAcceleratorTableW@12:   dd unicows_initial_stub_CopyAcceleratorTableW
_Unicows_CopyAcceleratorTableW:      dd 0
namestring_CopyAcceleratorTableW:    db 'CopyAcceleratorTableW',0
