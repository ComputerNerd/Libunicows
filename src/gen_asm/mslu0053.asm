%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetTextExtentPointW@16
                    global GetTextExtentPointW
                    global _GetTextExtentPointW@16
                    global _Unicows_GetTextExtentPointW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetTextExtentPointW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTextExtentPointW@16     ; place to save the pointer
                    push dword [_Unicows_GetTextExtentPointW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetTextExtentPointW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetTextExtentPointW:
_GetTextExtentPointW@16:
                    jmp [__imp__GetTextExtentPointW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetTextExtentPointW@16:   dd unicows_initial_stub_GetTextExtentPointW
_Unicows_GetTextExtentPointW:      dd 0
namestring_GetTextExtentPointW:    db 'GetTextExtentPointW',0
