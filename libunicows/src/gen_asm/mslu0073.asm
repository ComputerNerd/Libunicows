%include "dll_names.inc"

                    global __imp__mixerGetControlDetailsW@12
                    global _mixerGetControlDetailsW@12
                    global _Unicows_mixerGetControlDetailsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_mixerGetControlDetailsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mixerGetControlDetailsW@12     ; place to save the pointer
                    push dword [_Unicows_mixerGetControlDetailsW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mixerGetControlDetailsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__mixerGetControlDetailsW@12]

_mixerGetControlDetailsW@12:
                    jmp [__imp__mixerGetControlDetailsW@12]


                    section .data

__imp__mixerGetControlDetailsW@12:   dd unicows_initial_stub_mixerGetControlDetailsW
_Unicows_mixerGetControlDetailsW:      dd 0
namestring_mixerGetControlDetailsW:    db 'mixerGetControlDetailsW',0
