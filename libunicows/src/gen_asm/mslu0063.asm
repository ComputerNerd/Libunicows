%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__auxGetDevCapsW@12
                    global auxGetDevCapsW
                    global _auxGetDevCapsW@12
                    global _Unicows_auxGetDevCapsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_auxGetDevCapsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__auxGetDevCapsW@12     ; place to save the pointer
                    push dword [_Unicows_auxGetDevCapsW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_auxGetDevCapsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

auxGetDevCapsW:
_auxGetDevCapsW@12:
                    jmp [__imp__auxGetDevCapsW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__auxGetDevCapsW@12:   dd unicows_initial_stub_auxGetDevCapsW
_Unicows_auxGetDevCapsW:      dd 0
namestring_auxGetDevCapsW:    db 'auxGetDevCapsW',0
