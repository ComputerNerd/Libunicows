%include "dll_names.inc"

                    global __imp__midiInGetErrorTextW@12
                    global _midiInGetErrorTextW@12
                    global _Unicows_midiInGetErrorTextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_midiInGetErrorTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__midiInGetErrorTextW@12     ; place to save the pointer
                    push dword [_Unicows_midiInGetErrorTextW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_midiInGetErrorTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__midiInGetErrorTextW@12]

_midiInGetErrorTextW@12:
                    jmp [__imp__midiInGetErrorTextW@12]


                    section .data

__imp__midiInGetErrorTextW@12:   dd unicows_initial_stub_midiInGetErrorTextW
_Unicows_midiInGetErrorTextW:      dd 0
namestring_midiInGetErrorTextW:    db 'midiInGetErrorTextW',0
