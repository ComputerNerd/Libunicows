%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__MoveFileW@8
                    global MoveFileW
                    global _MoveFileW@8
                    global _Unicows_MoveFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_MoveFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MoveFileW@8     ; place to save the pointer
                    push dword [_Unicows_MoveFileW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_MoveFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

MoveFileW:
_MoveFileW@8:
                    jmp [__imp__MoveFileW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__MoveFileW@8:   dd unicows_initial_stub_MoveFileW
_Unicows_MoveFileW:      dd 0
namestring_MoveFileW:    db 'MoveFileW',0
