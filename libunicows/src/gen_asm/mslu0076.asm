%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__mixerGetLineInfoW@12
                    global mixerGetLineInfoW
                    global _mixerGetLineInfoW@12
                    global _Unicows_mixerGetLineInfoW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_mixerGetLineInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mixerGetLineInfoW@12     ; place to save the pointer
                    push dword [_Unicows_mixerGetLineInfoW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mixerGetLineInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

mixerGetLineInfoW:
_mixerGetLineInfoW@12:
                    jmp [__imp__mixerGetLineInfoW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__mixerGetLineInfoW@12:   dd unicows_initial_stub_mixerGetLineInfoW
_Unicows_mixerGetLineInfoW:      dd 0
namestring_mixerGetLineInfoW:    db 'mixerGetLineInfoW',0
