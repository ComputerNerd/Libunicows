%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetCharWidth32W@16
                    global GetCharWidth32W
                    global _GetCharWidth32W@16
                    global _Unicows_GetCharWidth32W
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetCharWidth32W:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCharWidth32W@16     ; place to save the pointer
                    push dword [_Unicows_GetCharWidth32W]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetCharWidth32W      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetCharWidth32W:
_GetCharWidth32W@16:
                    jmp [__imp__GetCharWidth32W@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetCharWidth32W@16:   dd unicows_initial_stub_GetCharWidth32W
_Unicows_GetCharWidth32W:      dd 0
namestring_GetCharWidth32W:    db 'GetCharWidth32W',0
