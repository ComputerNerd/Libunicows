%include "dll_names.inc"

                    global __imp__CreateStdAccessibleProxyW@20
                    global CreateStdAccessibleProxyW
                    global _CreateStdAccessibleProxyW@20
                    global _Unicows_CreateStdAccessibleProxyW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateStdAccessibleProxyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateStdAccessibleProxyW@20     ; place to save the pointer
                    push dword [_Unicows_CreateStdAccessibleProxyW]      ; default proc, if any
                    push dword OLEACC                  ; dll id
                    push dword namestring_CreateStdAccessibleProxyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateStdAccessibleProxyW:
_CreateStdAccessibleProxyW@20:
                    jmp [__imp__CreateStdAccessibleProxyW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateStdAccessibleProxyW@20:   dd unicows_initial_stub_CreateStdAccessibleProxyW
_Unicows_CreateStdAccessibleProxyW:      dd 0
namestring_CreateStdAccessibleProxyW:    db 'CreateStdAccessibleProxyW',0
