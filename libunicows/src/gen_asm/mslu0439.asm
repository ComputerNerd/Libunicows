%include "dll_names.inc"

                    global __imp__RasHangUpW@4
                    global RasHangUpW
                    global _RasHangUpW@4
                    global _Unicows_RasHangUpW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasHangUpW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasHangUpW@4     ; place to save the pointer
                    push dword [_Unicows_RasHangUpW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasHangUpW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasHangUpW:
_RasHangUpW@4:
                    jmp [__imp__RasHangUpW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasHangUpW@4:   dd unicows_initial_stub_RasHangUpW
_Unicows_RasHangUpW:      dd 0
namestring_RasHangUpW:    db 'RasHangUpW',0
