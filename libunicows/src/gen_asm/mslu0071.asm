%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__midiInGetErrorTextW@12
                    global midiInGetErrorTextW
                    global _midiInGetErrorTextW@12
                    global _Unicows_midiInGetErrorTextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

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

                    ; ...and skip to it (see following jmp instruction):

midiInGetErrorTextW:
_midiInGetErrorTextW@12:
                    jmp [__imp__midiInGetErrorTextW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__midiInGetErrorTextW@12:   dd unicows_initial_stub_midiInGetErrorTextW
_Unicows_midiInGetErrorTextW:      dd 0
namestring_midiInGetErrorTextW:    db 'midiInGetErrorTextW',0
