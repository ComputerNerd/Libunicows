%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CharUpperW@4
                    global CharUpperW
                    global _CharUpperW@4
                    global _Unicows_CharUpperW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CharUpperW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CharUpperW@4     ; place to save the pointer
                    push dword [_Unicows_CharUpperW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CharUpperW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CharUpperW:
_CharUpperW@4:
                    jmp [__imp__CharUpperW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CharUpperW@4:   dd unicows_initial_stub_CharUpperW
_Unicows_CharUpperW:      dd 0
namestring_CharUpperW:    db 'CharUpperW',0
