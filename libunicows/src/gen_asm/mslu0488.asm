%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__SetJobW@20
                    global SetJobW
                    global _SetJobW@20
                    global _Unicows_SetJobW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetJobW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetJobW@20     ; place to save the pointer
                    push dword [_Unicows_SetJobW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_SetJobW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetJobW:
_SetJobW@20:
                    jmp [__imp__SetJobW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetJobW@20:   dd unicows_initial_stub_SetJobW
_Unicows_SetJobW:      dd 0
namestring_SetJobW:    db 'SetJobW',0
