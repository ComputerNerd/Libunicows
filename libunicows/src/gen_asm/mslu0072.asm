%include "dll_names.inc"

                    global __imp__midiOutGetErrorTextW@12
                    global _midiOutGetErrorTextW@12
                    global _Unicows_midiOutGetErrorTextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_midiOutGetErrorTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__midiOutGetErrorTextW@12     ; place to save the pointer
                    push dword [_Unicows_midiOutGetErrorTextW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_midiOutGetErrorTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__midiOutGetErrorTextW@12]

_midiOutGetErrorTextW@12:
                    jmp [__imp__midiOutGetErrorTextW@12]


                    section .data

__imp__midiOutGetErrorTextW@12:   dd unicows_initial_stub_midiOutGetErrorTextW
_Unicows_midiOutGetErrorTextW:      dd 0
namestring_midiOutGetErrorTextW:    db 'midiOutGetErrorTextW',0
