%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__DdeInitializeW@16
                    global DdeInitializeW
                    global _DdeInitializeW@16
                    global _Unicows_DdeInitializeW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DdeInitializeW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DdeInitializeW@16     ; place to save the pointer
                    push dword [_Unicows_DdeInitializeW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DdeInitializeW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DdeInitializeW:
_DdeInitializeW@16:
                    jmp [__imp__DdeInitializeW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DdeInitializeW@16:   dd unicows_initial_stub_DdeInitializeW
_Unicows_DdeInitializeW:      dd 0
namestring_DdeInitializeW:    db 'DdeInitializeW',0
