%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__LoadStringW@16
                    global LoadStringW
                    global _LoadStringW@16
                    global _Unicows_LoadStringW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_LoadStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadStringW@16     ; place to save the pointer
                    push dword [_Unicows_LoadStringW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

LoadStringW:
_LoadStringW@16:
                    jmp [__imp__LoadStringW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__LoadStringW@16:   dd unicows_initial_stub_LoadStringW
_Unicows_LoadStringW:      dd 0
namestring_LoadStringW:    db 'LoadStringW',0
