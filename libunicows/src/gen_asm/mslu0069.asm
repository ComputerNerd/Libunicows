%include "dll_names.inc"

                    global __imp__midiInGetDevCapsW@12
                    global _midiInGetDevCapsW@12
                    global _Unicows_midiInGetDevCapsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_midiInGetDevCapsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__midiInGetDevCapsW@12     ; place to save the pointer
                    push dword [_Unicows_midiInGetDevCapsW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_midiInGetDevCapsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__midiInGetDevCapsW@12]

_midiInGetDevCapsW@12:
                    jmp [__imp__midiInGetDevCapsW@12]


                    section .data

__imp__midiInGetDevCapsW@12:   dd unicows_initial_stub_midiInGetDevCapsW
_Unicows_midiInGetDevCapsW:      dd 0
namestring_midiInGetDevCapsW:    db 'midiInGetDevCapsW',0
