%include "dll_names.inc"

                    global __imp__TranslateAcceleratorW@12
                    global _TranslateAcceleratorW@12
                    global _Unicows_TranslateAcceleratorW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_TranslateAcceleratorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__TranslateAcceleratorW@12     ; place to save the pointer
                    push dword [_Unicows_TranslateAcceleratorW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_TranslateAcceleratorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__TranslateAcceleratorW@12]

_TranslateAcceleratorW@12:
                    jmp [__imp__TranslateAcceleratorW@12]


                    section .data

__imp__TranslateAcceleratorW@12:   dd unicows_initial_stub_TranslateAcceleratorW
_Unicows_TranslateAcceleratorW:      dd 0
namestring_TranslateAcceleratorW:    db 'TranslateAcceleratorW',0
