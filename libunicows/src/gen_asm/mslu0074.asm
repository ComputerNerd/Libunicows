%include "dll_names.inc"

                    global __imp__mixerGetDevCapsW@12
                    global mixerGetDevCapsW
                    global _mixerGetDevCapsW@12
                    global _Unicows_mixerGetDevCapsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_mixerGetDevCapsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mixerGetDevCapsW@12     ; place to save the pointer
                    push dword [_Unicows_mixerGetDevCapsW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mixerGetDevCapsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

mixerGetDevCapsW:
_mixerGetDevCapsW@12:
                    jmp [__imp__mixerGetDevCapsW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__mixerGetDevCapsW@12:   dd unicows_initial_stub_mixerGetDevCapsW
_Unicows_mixerGetDevCapsW:      dd 0
namestring_mixerGetDevCapsW:    db 'mixerGetDevCapsW',0
