%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetPropA@8
                    global GetPropA
                    global _GetPropA@8
                    global _Unicows_GetPropA
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetPropA:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPropA@8     ; place to save the pointer
                    push dword [_Unicows_GetPropA]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetPropA      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetPropA:
_GetPropA@8:
                    jmp [__imp__GetPropA@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetPropA@8:   dd unicows_initial_stub_GetPropA
_Unicows_GetPropA:      dd 0
namestring_GetPropA:    db 'GetPropA',0