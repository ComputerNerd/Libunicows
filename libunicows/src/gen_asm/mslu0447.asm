%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RasGetConnectStatusW@8
                    global RasGetConnectStatusW
                    global _RasGetConnectStatusW@8
                    global _Unicows_RasGetConnectStatusW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasGetConnectStatusW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasGetConnectStatusW@8     ; place to save the pointer
                    push dword [_Unicows_RasGetConnectStatusW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasGetConnectStatusW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasGetConnectStatusW:
_RasGetConnectStatusW@8:
                    jmp [__imp__RasGetConnectStatusW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasGetConnectStatusW@8:   dd unicows_initial_stub_RasGetConnectStatusW
_Unicows_RasGetConnectStatusW:      dd 0
namestring_RasGetConnectStatusW:    db 'RasGetConnectStatusW',0
