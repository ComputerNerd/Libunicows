%include "dll_names.inc"

                    global __imp__GetEnvironmentVariableW@12
                    global GetEnvironmentVariableW
                    global _GetEnvironmentVariableW@12
                    global _Unicows_GetEnvironmentVariableW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetEnvironmentVariableW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetEnvironmentVariableW@12     ; place to save the pointer
                    push dword [_Unicows_GetEnvironmentVariableW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetEnvironmentVariableW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetEnvironmentVariableW:
_GetEnvironmentVariableW@12:
                    jmp [__imp__GetEnvironmentVariableW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetEnvironmentVariableW@12:   dd unicows_initial_stub_GetEnvironmentVariableW
_Unicows_GetEnvironmentVariableW:      dd 0
namestring_GetEnvironmentVariableW:    db 'GetEnvironmentVariableW',0
