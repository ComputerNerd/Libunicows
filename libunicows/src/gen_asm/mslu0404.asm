%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__SetEnvironmentVariableW@8
                    global SetEnvironmentVariableW
                    global _SetEnvironmentVariableW@8
                    global _Unicows_SetEnvironmentVariableW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetEnvironmentVariableW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetEnvironmentVariableW@8     ; place to save the pointer
                    push dword [_Unicows_SetEnvironmentVariableW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SetEnvironmentVariableW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetEnvironmentVariableW:
_SetEnvironmentVariableW@8:
                    jmp [__imp__SetEnvironmentVariableW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetEnvironmentVariableW@8:   dd unicows_initial_stub_SetEnvironmentVariableW
_Unicows_SetEnvironmentVariableW:      dd 0
namestring_SetEnvironmentVariableW:    db 'SetEnvironmentVariableW',0
