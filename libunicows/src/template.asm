%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__NAME@SIZE
                    global NAME
                    global _NAME@SIZE
                    global _Unicows_NAME
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_NAME:
                    ; Load the symbol...
                    pusha
                    push dword __imp__NAME@SIZE     ; place to save the pointer
                    push dword [_Unicows_NAME]      ; default proc, if any
                    push dword DLL                  ; dll id
                    push dword namestring_NAME      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

NAME:
_NAME@SIZE:
                    jmp [__imp__NAME@SIZE]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__NAME@SIZE:   dd unicows_initial_stub_NAME
_Unicows_NAME:      dd 0
namestring_NAME:    db 'NAME',0
