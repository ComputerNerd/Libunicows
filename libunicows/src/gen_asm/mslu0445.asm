%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RasEnumConnectionsW@12
                    global RasEnumConnectionsW
                    global _RasEnumConnectionsW@12
                    global _Unicows_RasEnumConnectionsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasEnumConnectionsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasEnumConnectionsW@12     ; place to save the pointer
                    push dword [_Unicows_RasEnumConnectionsW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasEnumConnectionsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasEnumConnectionsW:
_RasEnumConnectionsW@12:
                    jmp [__imp__RasEnumConnectionsW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasEnumConnectionsW@12:   dd unicows_initial_stub_RasEnumConnectionsW
_Unicows_RasEnumConnectionsW:      dd 0
namestring_RasEnumConnectionsW:    db 'RasEnumConnectionsW',0
