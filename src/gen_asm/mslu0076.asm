%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__mixerGetLineControlsW@12
                    global mixerGetLineControlsW
                    global _mixerGetLineControlsW@12
                    global _Unicows_mixerGetLineControlsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_mixerGetLineControlsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mixerGetLineControlsW@12     ; place to save the pointer
                    push dword [_Unicows_mixerGetLineControlsW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mixerGetLineControlsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

mixerGetLineControlsW:
_mixerGetLineControlsW@12:
                    jmp [__imp__mixerGetLineControlsW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__mixerGetLineControlsW@12:   dd unicows_initial_stub_mixerGetLineControlsW
_Unicows_mixerGetLineControlsW:      dd 0
namestring_mixerGetLineControlsW:    db 'mixerGetLineControlsW',0
