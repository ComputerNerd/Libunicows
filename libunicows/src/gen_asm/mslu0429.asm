%include "dll_names.inc"

                    global __imp__RasDeleteSubEntryW@12
                    global RasDeleteSubEntryW
                    global _RasDeleteSubEntryW@12
                    global _Unicows_RasDeleteSubEntryW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasDeleteSubEntryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasDeleteSubEntryW@12     ; place to save the pointer
                    push dword [_Unicows_RasDeleteSubEntryW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasDeleteSubEntryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasDeleteSubEntryW:
_RasDeleteSubEntryW@12:
                    jmp [__imp__RasDeleteSubEntryW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasDeleteSubEntryW@12:   dd unicows_initial_stub_RasDeleteSubEntryW
_Unicows_RasDeleteSubEntryW:      dd 0
namestring_RasDeleteSubEntryW:    db 'RasDeleteSubEntryW',0
