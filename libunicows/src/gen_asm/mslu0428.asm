%include "dll_names.inc"

                    global __imp__RasDeleteEntryW@8
                    global RasDeleteEntryW
                    global _RasDeleteEntryW@8
                    global _Unicows_RasDeleteEntryW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasDeleteEntryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasDeleteEntryW@8     ; place to save the pointer
                    push dword [_Unicows_RasDeleteEntryW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasDeleteEntryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasDeleteEntryW:
_RasDeleteEntryW@8:
                    jmp [__imp__RasDeleteEntryW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasDeleteEntryW@8:   dd unicows_initial_stub_RasDeleteEntryW
_Unicows_RasDeleteEntryW:      dd 0
namestring_RasDeleteEntryW:    db 'RasDeleteEntryW',0
