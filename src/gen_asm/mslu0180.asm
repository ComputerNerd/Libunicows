%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__IsCharAlphaW@4
                    global IsCharAlphaW
                    global _IsCharAlphaW@4
                    global _Unicows_IsCharAlphaW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_IsCharAlphaW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsCharAlphaW@4     ; place to save the pointer
                    push dword [_Unicows_IsCharAlphaW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_IsCharAlphaW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

IsCharAlphaW:
_IsCharAlphaW@4:
                    jmp [__imp__IsCharAlphaW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__IsCharAlphaW@4:   dd unicows_initial_stub_IsCharAlphaW
_Unicows_IsCharAlphaW:      dd 0
namestring_IsCharAlphaW:    db 'IsCharAlphaW',0
