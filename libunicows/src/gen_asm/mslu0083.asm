%include "dll_names.inc"

                    global __imp__waveInGetErrorTextW@12
                    global _waveInGetErrorTextW@12
                    global _Unicows_waveInGetErrorTextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_waveInGetErrorTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__waveInGetErrorTextW@12     ; place to save the pointer
                    push dword [_Unicows_waveInGetErrorTextW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_waveInGetErrorTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__waveInGetErrorTextW@12]

_waveInGetErrorTextW@12:
                    jmp [__imp__waveInGetErrorTextW@12]


                    section .data

__imp__waveInGetErrorTextW@12:   dd unicows_initial_stub_waveInGetErrorTextW
_Unicows_waveInGetErrorTextW:      dd 0
namestring_waveInGetErrorTextW:    db 'waveInGetErrorTextW',0
