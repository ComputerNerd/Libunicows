%include "dll_names.inc"

                    global __imp__RasGetEntryPropertiesW@24
                    global RasGetEntryPropertiesW
                    global _RasGetEntryPropertiesW@24
                    global _Unicows_RasGetEntryPropertiesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasGetEntryPropertiesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasGetEntryPropertiesW@24     ; place to save the pointer
                    push dword [_Unicows_RasGetEntryPropertiesW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasGetEntryPropertiesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasGetEntryPropertiesW:
_RasGetEntryPropertiesW@24:
                    jmp [__imp__RasGetEntryPropertiesW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasGetEntryPropertiesW@24:   dd unicows_initial_stub_RasGetEntryPropertiesW
_Unicows_RasGetEntryPropertiesW:      dd 0
namestring_RasGetEntryPropertiesW:    db 'RasGetEntryPropertiesW',0
