%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__PeekMessageW@20
                    global PeekMessageW
                    global _PeekMessageW@20
                    global _Unicows_PeekMessageW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_PeekMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__PeekMessageW@20     ; place to save the pointer
                    push dword [_Unicows_PeekMessageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_PeekMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

PeekMessageW:
_PeekMessageW@20:
                    jmp [__imp__PeekMessageW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__PeekMessageW@20:   dd unicows_initial_stub_PeekMessageW
_Unicows_PeekMessageW:      dd 0
namestring_PeekMessageW:    db 'PeekMessageW',0
