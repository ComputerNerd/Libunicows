%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CreateMDIWindowW@40
                    global CreateMDIWindowW
                    global _CreateMDIWindowW@40
                    global _Unicows_CreateMDIWindowW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateMDIWindowW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateMDIWindowW@40     ; place to save the pointer
                    push dword [_Unicows_CreateMDIWindowW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CreateMDIWindowW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateMDIWindowW:
_CreateMDIWindowW@40:
                    jmp [__imp__CreateMDIWindowW@40]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateMDIWindowW@40:   dd unicows_initial_stub_CreateMDIWindowW
_Unicows_CreateMDIWindowW:      dd 0
namestring_CreateMDIWindowW:    db 'CreateMDIWindowW',0
