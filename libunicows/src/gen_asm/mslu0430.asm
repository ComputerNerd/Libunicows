%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RasDialW@24
                    global RasDialW
                    global _RasDialW@24
                    global _Unicows_RasDialW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasDialW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasDialW@24     ; place to save the pointer
                    push dword [_Unicows_RasDialW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasDialW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasDialW:
_RasDialW@24:
                    jmp [__imp__RasDialW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasDialW@24:   dd unicows_initial_stub_RasDialW
_Unicows_RasDialW:      dd 0
namestring_RasDialW:    db 'RasDialW',0
