%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__EnumPrintersW@28
                    global EnumPrintersW
                    global _EnumPrintersW@28
                    global _Unicows_EnumPrintersW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumPrintersW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPrintersW@28     ; place to save the pointer
                    push dword [_Unicows_EnumPrintersW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_EnumPrintersW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumPrintersW:
_EnumPrintersW@28:
                    jmp [__imp__EnumPrintersW@28]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumPrintersW@28:   dd unicows_initial_stub_EnumPrintersW
_Unicows_EnumPrintersW:      dd 0
namestring_EnumPrintersW:    db 'EnumPrintersW',0
