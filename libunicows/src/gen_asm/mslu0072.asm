%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__midiOutGetDevCapsW@12
                    global midiOutGetDevCapsW
                    global _midiOutGetDevCapsW@12
                    global _Unicows_midiOutGetDevCapsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

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

                    ; ...and skip to it (see following jmp instruction):

midiOutGetDevCapsW:
_midiOutGetDevCapsW@12:
                    jmp [__imp__midiOutGetDevCapsW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__midiOutGetDevCapsW@12:   dd unicows_initial_stub_midiOutGetDevCapsW
_Unicows_midiOutGetDevCapsW:      dd 0
namestring_midiOutGetDevCapsW:    db 'midiOutGetDevCapsW',0
