%include "dll_names.inc"

                    global __imp__InitializeSecurityContextW@48
                    global InitializeSecurityContextW
                    global _InitializeSecurityContextW@48
                    global _Unicows_InitializeSecurityContextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_InitializeSecurityContextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__InitializeSecurityContextW@48     ; place to save the pointer
                    push dword [_Unicows_InitializeSecurityContextW]      ; default proc, if any
                    push dword SECUR32                  ; dll id
                    push dword namestring_InitializeSecurityContextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

InitializeSecurityContextW:
_InitializeSecurityContextW@48:
                    jmp [__imp__InitializeSecurityContextW@48]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__InitializeSecurityContextW@48:   dd unicows_initial_stub_InitializeSecurityContextW
_Unicows_InitializeSecurityContextW:      dd 0
namestring_InitializeSecurityContextW:    db 'InitializeSecurityContextW',0
