%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetTextExtentPoint32W@16
                    global GetTextExtentPoint32W
                    global _GetTextExtentPoint32W@16
                    global _Unicows_GetTextExtentPoint32W
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetTextExtentPoint32W:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTextExtentPoint32W@16     ; place to save the pointer
                    push dword [_Unicows_GetTextExtentPoint32W]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetTextExtentPoint32W      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetTextExtentPoint32W:
_GetTextExtentPoint32W@16:
                    jmp [__imp__GetTextExtentPoint32W@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetTextExtentPoint32W@16:   dd unicows_initial_stub_GetTextExtentPoint32W
_Unicows_GetTextExtentPoint32W:      dd 0
namestring_GetTextExtentPoint32W:    db 'GetTextExtentPoint32W',0
