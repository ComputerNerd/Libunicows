%include "dll_names.inc"

                    global __imp__waveInGetDevCapsW@12
                    global _waveInGetDevCapsW@12
                    global _Unicows_waveInGetDevCapsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_waveInGetDevCapsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__waveInGetDevCapsW@12     ; place to save the pointer
                    push dword [_Unicows_waveInGetDevCapsW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_waveInGetDevCapsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__waveInGetDevCapsW@12]

_waveInGetDevCapsW@12:
                    jmp [__imp__waveInGetDevCapsW@12]


                    section .data

__imp__waveInGetDevCapsW@12:   dd unicows_initial_stub_waveInGetDevCapsW
_Unicows_waveInGetDevCapsW:      dd 0
namestring_waveInGetDevCapsW:    db 'waveInGetDevCapsW',0
