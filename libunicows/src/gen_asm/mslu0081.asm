%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__mmioStringToFOURCCW@8
                    global mmioStringToFOURCCW
                    global _mmioStringToFOURCCW@8
                    global _Unicows_mmioStringToFOURCCW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_mmioStringToFOURCCW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mmioStringToFOURCCW@8     ; place to save the pointer
                    push dword [_Unicows_mmioStringToFOURCCW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mmioStringToFOURCCW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

mmioStringToFOURCCW:
_mmioStringToFOURCCW@8:
                    jmp [__imp__mmioStringToFOURCCW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__mmioStringToFOURCCW@8:   dd unicows_initial_stub_mmioStringToFOURCCW
_Unicows_mmioStringToFOURCCW:      dd 0
namestring_mmioStringToFOURCCW:    db 'mmioStringToFOURCCW',0
