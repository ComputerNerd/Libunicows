%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RasSetEntryPropertiesW@24
                    global RasSetEntryPropertiesW
                    global _RasSetEntryPropertiesW@24
                    global _Unicows_RasSetEntryPropertiesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasSetEntryPropertiesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasSetEntryPropertiesW@24     ; place to save the pointer
                    push dword [_Unicows_RasSetEntryPropertiesW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasSetEntryPropertiesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasSetEntryPropertiesW:
_RasSetEntryPropertiesW@24:
                    jmp [__imp__RasSetEntryPropertiesW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasSetEntryPropertiesW@24:   dd unicows_initial_stub_RasSetEntryPropertiesW
_Unicows_RasSetEntryPropertiesW:      dd 0
namestring_RasSetEntryPropertiesW:    db 'RasSetEntryPropertiesW',0
