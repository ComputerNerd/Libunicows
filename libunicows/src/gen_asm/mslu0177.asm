%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__InsertMenuW@20
                    global InsertMenuW
                    global _InsertMenuW@20
                    global _Unicows_InsertMenuW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_InsertMenuW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__InsertMenuW@20     ; place to save the pointer
                    push dword [_Unicows_InsertMenuW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_InsertMenuW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

InsertMenuW:
_InsertMenuW@20:
                    jmp [__imp__InsertMenuW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__InsertMenuW@20:   dd unicows_initial_stub_InsertMenuW
_Unicows_InsertMenuW:      dd 0
namestring_InsertMenuW:    db 'InsertMenuW',0
