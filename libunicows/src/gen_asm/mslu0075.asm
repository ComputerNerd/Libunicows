%include "dll_names.inc"

                    global __imp__mixerGetLineControlsW@12
                    global _mixerGetLineControlsW@12
                    global _Unicows_mixerGetLineControlsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_mixerGetLineControlsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mixerGetLineControlsW@12     ; place to save the pointer
                    push dword [_Unicows_mixerGetLineControlsW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mixerGetLineControlsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__mixerGetLineControlsW@12]

_mixerGetLineControlsW@12:
                    jmp [__imp__mixerGetLineControlsW@12]


                    section .data

__imp__mixerGetLineControlsW@12:   dd unicows_initial_stub_mixerGetLineControlsW
_Unicows_mixerGetLineControlsW:      dd 0
namestring_mixerGetLineControlsW:    db 'mixerGetLineControlsW',0
