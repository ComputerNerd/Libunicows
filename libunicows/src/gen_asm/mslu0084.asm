%include "dll_names.inc"

                    global __imp__waveOutGetDevCapsW@12
                    global _waveOutGetDevCapsW@12
                    global _Unicows_waveOutGetDevCapsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_waveOutGetDevCapsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__waveOutGetDevCapsW@12     ; place to save the pointer
                    push dword [_Unicows_waveOutGetDevCapsW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_waveOutGetDevCapsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__waveOutGetDevCapsW@12]

_waveOutGetDevCapsW@12:
                    jmp [__imp__waveOutGetDevCapsW@12]


                    section .data

__imp__waveOutGetDevCapsW@12:   dd unicows_initial_stub_waveOutGetDevCapsW
_Unicows_waveOutGetDevCapsW:      dd 0
namestring_waveOutGetDevCapsW:    db 'waveOutGetDevCapsW',0