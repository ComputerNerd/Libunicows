%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__midiOutGetErrorTextW@12
                    global midiOutGetErrorTextW
                    global _midiOutGetErrorTextW@12
                    global _Unicows_midiOutGetErrorTextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

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

                    ; ...and skip to it (see following jmp instruction):

midiOutGetErrorTextW:
_midiOutGetErrorTextW@12:
                    jmp [__imp__midiOutGetErrorTextW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__midiOutGetErrorTextW@12:   dd unicows_initial_stub_midiOutGetErrorTextW
_Unicows_midiOutGetErrorTextW:      dd 0
namestring_midiOutGetErrorTextW:    db 'midiOutGetErrorTextW',0
