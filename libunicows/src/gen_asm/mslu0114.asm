%include "dll_names.inc"

                    global __imp__CharUpperBuffW@8
                    global CharUpperBuffW
                    global _CharUpperBuffW@8
                    global _Unicows_CharUpperBuffW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CharUpperBuffW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CharUpperBuffW@8     ; place to save the pointer
                    push dword [_Unicows_CharUpperBuffW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CharUpperBuffW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CharUpperBuffW:
_CharUpperBuffW@8:
                    jmp [__imp__CharUpperBuffW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CharUpperBuffW@8:   dd unicows_initial_stub_CharUpperBuffW
_Unicows_CharUpperBuffW:      dd 0
namestring_CharUpperBuffW:    db 'CharUpperBuffW',0
