%include "dll_names.inc"

                    global __imp__mmioOpenW@12
                    global _mmioOpenW@12
                    global _Unicows_mmioOpenW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_mmioOpenW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mmioOpenW@12     ; place to save the pointer
                    push dword [_Unicows_mmioOpenW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mmioOpenW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__mmioOpenW@12]

_mmioOpenW@12:
                    jmp [__imp__mmioOpenW@12]


                    section .data

__imp__mmioOpenW@12:   dd unicows_initial_stub_mmioOpenW
_Unicows_mmioOpenW:      dd 0
namestring_mmioOpenW:    db 'mmioOpenW',0
