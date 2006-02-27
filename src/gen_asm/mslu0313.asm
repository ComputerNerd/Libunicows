%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CreateMailslotW@16
                    global CreateMailslotW
                    global _CreateMailslotW@16
                    global _Unicows_CreateMailslotW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateMailslotW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateMailslotW@16     ; place to save the pointer
                    push dword [_Unicows_CreateMailslotW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateMailslotW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateMailslotW:
_CreateMailslotW@16:
                    jmp [__imp__CreateMailslotW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateMailslotW@16:   dd unicows_initial_stub_CreateMailslotW
_Unicows_CreateMailslotW:      dd 0
namestring_CreateMailslotW:    db 'CreateMailslotW',0
