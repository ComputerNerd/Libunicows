%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RegConnectRegistryW@12
                    global RegConnectRegistryW
                    global _RegConnectRegistryW@12
                    global _Unicows_RegConnectRegistryW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegConnectRegistryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegConnectRegistryW@12     ; place to save the pointer
                    push dword [_Unicows_RegConnectRegistryW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegConnectRegistryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegConnectRegistryW:
_RegConnectRegistryW@12:
                    jmp [__imp__RegConnectRegistryW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegConnectRegistryW@12:   dd unicows_initial_stub_RegConnectRegistryW
_Unicows_RegConnectRegistryW:      dd 0
namestring_RegConnectRegistryW:    db 'RegConnectRegistryW',0
