%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__ExpandEnvironmentStringsW@12
                    global ExpandEnvironmentStringsW
                    global _ExpandEnvironmentStringsW@12
                    global _Unicows_ExpandEnvironmentStringsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ExpandEnvironmentStringsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ExpandEnvironmentStringsW@12     ; place to save the pointer
                    push dword [_Unicows_ExpandEnvironmentStringsW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_ExpandEnvironmentStringsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ExpandEnvironmentStringsW:
_ExpandEnvironmentStringsW@12:
                    jmp [__imp__ExpandEnvironmentStringsW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ExpandEnvironmentStringsW@12:   dd unicows_initial_stub_ExpandEnvironmentStringsW
_Unicows_ExpandEnvironmentStringsW:      dd 0
namestring_ExpandEnvironmentStringsW:    db 'ExpandEnvironmentStringsW',0
