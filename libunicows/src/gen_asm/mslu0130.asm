%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__DefFrameProcW@20
                    global DefFrameProcW
                    global _DefFrameProcW@20
                    global _Unicows_DefFrameProcW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DefFrameProcW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DefFrameProcW@20     ; place to save the pointer
                    push dword [_Unicows_DefFrameProcW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DefFrameProcW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DefFrameProcW:
_DefFrameProcW@20:
                    jmp [__imp__DefFrameProcW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DefFrameProcW@20:   dd unicows_initial_stub_DefFrameProcW
_Unicows_DefFrameProcW:      dd 0
namestring_DefFrameProcW:    db 'DefFrameProcW',0
