%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__midiInGetDevCapsW@12
                    global midiInGetDevCapsW
                    global _midiInGetDevCapsW@12
                    global _Unicows_midiInGetDevCapsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

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

                    ; ...and skip to it (see following jmp instruction):

midiInGetDevCapsW:
_midiInGetDevCapsW@12:
                    jmp [__imp__midiInGetDevCapsW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__midiInGetDevCapsW@12:   dd unicows_initial_stub_midiInGetDevCapsW
_Unicows_midiInGetDevCapsW:      dd 0
namestring_midiInGetDevCapsW:    db 'midiInGetDevCapsW',0
