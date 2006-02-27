%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__InitSecurityInterfaceW@0
                    global InitSecurityInterfaceW
                    global _InitSecurityInterfaceW@0
                    global _Unicows_InitSecurityInterfaceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_InitSecurityInterfaceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__InitSecurityInterfaceW@0     ; place to save the pointer
                    push dword [_Unicows_InitSecurityInterfaceW]      ; default proc, if any
                    push dword SECUR32                  ; dll id
                    push dword namestring_InitSecurityInterfaceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

InitSecurityInterfaceW:
_InitSecurityInterfaceW@0:
                    jmp [__imp__InitSecurityInterfaceW@0]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__InitSecurityInterfaceW@0:   dd unicows_initial_stub_InitSecurityInterfaceW
_Unicows_InitSecurityInterfaceW:      dd 0
namestring_InitSecurityInterfaceW:    db 'InitSecurityInterfaceW',0
