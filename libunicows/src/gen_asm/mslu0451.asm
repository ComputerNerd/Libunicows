%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RasGetProjectionInfoW@16
                    global RasGetProjectionInfoW
                    global _RasGetProjectionInfoW@16
                    global _Unicows_RasGetProjectionInfoW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasGetProjectionInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasGetProjectionInfoW@16     ; place to save the pointer
                    push dword [_Unicows_RasGetProjectionInfoW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasGetProjectionInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasGetProjectionInfoW:
_RasGetProjectionInfoW@16:
                    jmp [__imp__RasGetProjectionInfoW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasGetProjectionInfoW@16:   dd unicows_initial_stub_RasGetProjectionInfoW
_Unicows_RasGetProjectionInfoW:      dd 0
namestring_RasGetProjectionInfoW:    db 'RasGetProjectionInfoW',0
