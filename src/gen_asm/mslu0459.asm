%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__AddJobW@20
                    global AddJobW
                    global _AddJobW@20
                    global _Unicows_AddJobW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_AddJobW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AddJobW@20     ; place to save the pointer
                    push dword [_Unicows_AddJobW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_AddJobW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

AddJobW:
_AddJobW@20:
                    jmp [__imp__AddJobW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__AddJobW@20:   dd unicows_initial_stub_AddJobW
_Unicows_AddJobW:      dd 0
namestring_AddJobW:    db 'AddJobW',0
