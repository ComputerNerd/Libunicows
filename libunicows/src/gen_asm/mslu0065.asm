%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__joyGetDevCapsW@12
                    global joyGetDevCapsW
                    global _joyGetDevCapsW@12
                    global _Unicows_joyGetDevCapsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_joyGetDevCapsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__joyGetDevCapsW@12     ; place to save the pointer
                    push dword [_Unicows_joyGetDevCapsW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_joyGetDevCapsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

joyGetDevCapsW:
_joyGetDevCapsW@12:
                    jmp [__imp__joyGetDevCapsW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__joyGetDevCapsW@12:   dd unicows_initial_stub_joyGetDevCapsW
_Unicows_joyGetDevCapsW:      dd 0
namestring_joyGetDevCapsW:    db 'joyGetDevCapsW',0
