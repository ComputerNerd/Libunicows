%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__SetMenuItemInfoW@16
                    global SetMenuItemInfoW
                    global _SetMenuItemInfoW@16
                    global _Unicows_SetMenuItemInfoW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetMenuItemInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetMenuItemInfoW@16     ; place to save the pointer
                    push dword [_Unicows_SetMenuItemInfoW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetMenuItemInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetMenuItemInfoW:
_SetMenuItemInfoW@16:
                    jmp [__imp__SetMenuItemInfoW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetMenuItemInfoW@16:   dd unicows_initial_stub_SetMenuItemInfoW
_Unicows_SetMenuItemInfoW:      dd 0
namestring_SetMenuItemInfoW:    db 'SetMenuItemInfoW',0
