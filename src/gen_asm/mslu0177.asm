%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__InsertMenuItemW@16
                    global InsertMenuItemW
                    global _InsertMenuItemW@16
                    global _Unicows_InsertMenuItemW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_InsertMenuItemW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__InsertMenuItemW@16     ; place to save the pointer
                    push dword [_Unicows_InsertMenuItemW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_InsertMenuItemW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

InsertMenuItemW:
_InsertMenuItemW@16:
                    jmp [__imp__InsertMenuItemW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__InsertMenuItemW@16:   dd unicows_initial_stub_InsertMenuItemW
_Unicows_InsertMenuItemW:      dd 0
namestring_InsertMenuItemW:    db 'InsertMenuItemW',0
