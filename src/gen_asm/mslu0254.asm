%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__VerFindFileW@32
                    global VerFindFileW
                    global _VerFindFileW@32
                    global _Unicows_VerFindFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_VerFindFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__VerFindFileW@32     ; place to save the pointer
                    push dword [_Unicows_VerFindFileW]      ; default proc, if any
                    push dword VERSION                  ; dll id
                    push dword namestring_VerFindFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

VerFindFileW:
_VerFindFileW@32:
                    jmp [__imp__VerFindFileW@32]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__VerFindFileW@32:   dd unicows_initial_stub_VerFindFileW
_Unicows_VerFindFileW:      dd 0
namestring_VerFindFileW:    db 'VerFindFileW',0
