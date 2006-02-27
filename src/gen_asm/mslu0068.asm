%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__mciSendCommandW@16
                    global mciSendCommandW
                    global _mciSendCommandW@16
                    global _Unicows_mciSendCommandW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_mciSendCommandW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mciSendCommandW@16     ; place to save the pointer
                    push dword [_Unicows_mciSendCommandW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mciSendCommandW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

mciSendCommandW:
_mciSendCommandW@16:
                    jmp [__imp__mciSendCommandW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__mciSendCommandW@16:   dd unicows_initial_stub_mciSendCommandW
_Unicows_mciSendCommandW:      dd 0
namestring_mciSendCommandW:    db 'mciSendCommandW',0
