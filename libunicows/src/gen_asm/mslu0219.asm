%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__SetClassLongW@12
                    global SetClassLongW
                    global _SetClassLongW@12
                    global _Unicows_SetClassLongW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetClassLongW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetClassLongW@12     ; place to save the pointer
                    push dword [_Unicows_SetClassLongW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetClassLongW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetClassLongW:
_SetClassLongW@12:
                    jmp [__imp__SetClassLongW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetClassLongW@12:   dd unicows_initial_stub_SetClassLongW
_Unicows_SetClassLongW:      dd 0
namestring_SetClassLongW:    db 'SetClassLongW',0
