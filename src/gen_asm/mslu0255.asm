%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__VerInstallFileW@32
                    global VerInstallFileW
                    global _VerInstallFileW@32
                    global _Unicows_VerInstallFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_VerInstallFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__VerInstallFileW@32     ; place to save the pointer
                    push dword [_Unicows_VerInstallFileW]      ; default proc, if any
                    push dword VERSION                  ; dll id
                    push dword namestring_VerInstallFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

VerInstallFileW:
_VerInstallFileW@32:
                    jmp [__imp__VerInstallFileW@32]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__VerInstallFileW@32:   dd unicows_initial_stub_VerInstallFileW
_Unicows_VerInstallFileW:      dd 0
namestring_VerInstallFileW:    db 'VerInstallFileW',0
