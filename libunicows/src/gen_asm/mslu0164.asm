%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetMenuItemInfoW@16
                    global GetMenuItemInfoW
                    global _GetMenuItemInfoW@16
                    global _Unicows_GetMenuItemInfoW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetMenuItemInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetMenuItemInfoW@16     ; place to save the pointer
                    push dword [_Unicows_GetMenuItemInfoW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetMenuItemInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetMenuItemInfoW:
_GetMenuItemInfoW@16:
                    jmp [__imp__GetMenuItemInfoW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetMenuItemInfoW@16:   dd unicows_initial_stub_GetMenuItemInfoW
_Unicows_GetMenuItemInfoW:      dd 0
namestring_GetMenuItemInfoW:    db 'GetMenuItemInfoW',0
