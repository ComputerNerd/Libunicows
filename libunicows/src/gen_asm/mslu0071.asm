%include "dll_names.inc"

                    global __imp__midiOutGetDevCapsW@12
                    global _midiOutGetDevCapsW@12
                    global _Unicows_midiOutGetDevCapsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_midiOutGetDevCapsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__midiOutGetDevCapsW@12     ; place to save the pointer
                    push dword [_Unicows_midiOutGetDevCapsW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_midiOutGetDevCapsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__midiOutGetDevCapsW@12]

_midiOutGetDevCapsW@12:
                    jmp [__imp__midiOutGetDevCapsW@12]


                    section .data

__imp__midiOutGetDevCapsW@12:   dd unicows_initial_stub_midiOutGetDevCapsW
_Unicows_midiOutGetDevCapsW:      dd 0
namestring_midiOutGetDevCapsW:    db 'midiOutGetDevCapsW',0
