%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__mixerGetControlDetailsW@12
                    global mixerGetControlDetailsW
                    global _mixerGetControlDetailsW@12
                    global _Unicows_mixerGetControlDetailsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_mixerGetControlDetailsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mixerGetControlDetailsW@12     ; place to save the pointer
                    push dword [_Unicows_mixerGetControlDetailsW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mixerGetControlDetailsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

mixerGetControlDetailsW:
_mixerGetControlDetailsW@12:
                    jmp [__imp__mixerGetControlDetailsW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__mixerGetControlDetailsW@12:   dd unicows_initial_stub_mixerGetControlDetailsW
_Unicows_mixerGetControlDetailsW:      dd 0
namestring_mixerGetControlDetailsW:    db 'mixerGetControlDetailsW',0
