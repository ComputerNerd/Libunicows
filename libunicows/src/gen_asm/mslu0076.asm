%include "dll_names.inc"

                    global __imp__mixerGetLineInfoW@12
                    global _mixerGetLineInfoW@12
                    global _Unicows_mixerGetLineInfoW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_mixerGetLineInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mixerGetLineInfoW@12     ; place to save the pointer
                    push dword [_Unicows_mixerGetLineInfoW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mixerGetLineInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__mixerGetLineInfoW@12]

_mixerGetLineInfoW@12:
                    jmp [__imp__mixerGetLineInfoW@12]


                    section .data

__imp__mixerGetLineInfoW@12:   dd unicows_initial_stub_mixerGetLineInfoW
_Unicows_mixerGetLineInfoW:      dd 0
namestring_mixerGetLineInfoW:    db 'mixerGetLineInfoW',0
