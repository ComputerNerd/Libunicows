%include "dll_names.inc"

                    global __imp__waveOutGetErrorTextW@12
                    global _waveOutGetErrorTextW@12
                    global _Unicows_waveOutGetErrorTextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_waveOutGetErrorTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__waveOutGetErrorTextW@12     ; place to save the pointer
                    push dword [_Unicows_waveOutGetErrorTextW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_waveOutGetErrorTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__waveOutGetErrorTextW@12]

_waveOutGetErrorTextW@12:
                    jmp [__imp__waveOutGetErrorTextW@12]


                    section .data

__imp__waveOutGetErrorTextW@12:   dd unicows_initial_stub_waveOutGetErrorTextW
_Unicows_waveOutGetErrorTextW:      dd 0
namestring_waveOutGetErrorTextW:    db 'waveOutGetErrorTextW',0
