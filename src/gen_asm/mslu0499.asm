%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__AcquireCredentialsHandleW@36
                    global AcquireCredentialsHandleW
                    global _AcquireCredentialsHandleW@36
                    global _Unicows_AcquireCredentialsHandleW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_AcquireCredentialsHandleW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AcquireCredentialsHandleW@36     ; place to save the pointer
                    push dword [_Unicows_AcquireCredentialsHandleW]      ; default proc, if any
                    push dword SECUR32                  ; dll id
                    push dword namestring_AcquireCredentialsHandleW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

AcquireCredentialsHandleW:
_AcquireCredentialsHandleW@36:
                    jmp [__imp__AcquireCredentialsHandleW@36]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__AcquireCredentialsHandleW@36:   dd unicows_initial_stub_AcquireCredentialsHandleW
_Unicows_AcquireCredentialsHandleW:      dd 0
namestring_AcquireCredentialsHandleW:    db 'AcquireCredentialsHandleW',0
