%include "dll_names.inc"

                    global __imp__RasGetEntryDialParamsW@12
                    global RasGetEntryDialParamsW
                    global _RasGetEntryDialParamsW@12
                    global _Unicows_RasGetEntryDialParamsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasGetEntryDialParamsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasGetEntryDialParamsW@12     ; place to save the pointer
                    push dword [_Unicows_RasGetEntryDialParamsW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasGetEntryDialParamsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasGetEntryDialParamsW:
_RasGetEntryDialParamsW@12:
                    jmp [__imp__RasGetEntryDialParamsW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasGetEntryDialParamsW@12:   dd unicows_initial_stub_RasGetEntryDialParamsW
_Unicows_RasGetEntryDialParamsW:      dd 0
namestring_RasGetEntryDialParamsW:    db 'RasGetEntryDialParamsW',0
