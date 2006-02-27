%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__VerQueryValueW@16
                    global VerQueryValueW
                    global _VerQueryValueW@16
                    global _Unicows_VerQueryValueW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_VerQueryValueW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__VerQueryValueW@16     ; place to save the pointer
                    push dword [_Unicows_VerQueryValueW]      ; default proc, if any
                    push dword VERSION                  ; dll id
                    push dword namestring_VerQueryValueW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

VerQueryValueW:
_VerQueryValueW@16:
                    jmp [__imp__VerQueryValueW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__VerQueryValueW@16:   dd unicows_initial_stub_VerQueryValueW
_Unicows_VerQueryValueW:      dd 0
namestring_VerQueryValueW:    db 'VerQueryValueW',0