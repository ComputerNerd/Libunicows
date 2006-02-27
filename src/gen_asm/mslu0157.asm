%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetClassLongW@8
                    global GetClassLongW
                    global _GetClassLongW@8
                    global _Unicows_GetClassLongW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetClassLongW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetClassLongW@8     ; place to save the pointer
                    push dword [_Unicows_GetClassLongW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetClassLongW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetClassLongW:
_GetClassLongW@8:
                    jmp [__imp__GetClassLongW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetClassLongW@8:   dd unicows_initial_stub_GetClassLongW
_Unicows_GetClassLongW:      dd 0
namestring_GetClassLongW:    db 'GetClassLongW',0
