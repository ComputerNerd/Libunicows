%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RasEnumEntriesW@20
                    global RasEnumEntriesW
                    global _RasEnumEntriesW@20
                    global _Unicows_RasEnumEntriesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasEnumEntriesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasEnumEntriesW@20     ; place to save the pointer
                    push dword [_Unicows_RasEnumEntriesW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasEnumEntriesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasEnumEntriesW:
_RasEnumEntriesW@20:
                    jmp [__imp__RasEnumEntriesW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasEnumEntriesW@20:   dd unicows_initial_stub_RasEnumEntriesW
_Unicows_RasEnumEntriesW:      dd 0
namestring_RasEnumEntriesW:    db 'RasEnumEntriesW',0
