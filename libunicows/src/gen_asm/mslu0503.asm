%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__QueryContextAttributesW@12
                    global QueryContextAttributesW
                    global _QueryContextAttributesW@12
                    global _Unicows_QueryContextAttributesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_QueryContextAttributesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__QueryContextAttributesW@12     ; place to save the pointer
                    push dword [_Unicows_QueryContextAttributesW]      ; default proc, if any
                    push dword SECUR32                  ; dll id
                    push dword namestring_QueryContextAttributesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

QueryContextAttributesW:
_QueryContextAttributesW@12:
                    jmp [__imp__QueryContextAttributesW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__QueryContextAttributesW@12:   dd unicows_initial_stub_QueryContextAttributesW
_Unicows_QueryContextAttributesW:      dd 0
namestring_QueryContextAttributesW:    db 'QueryContextAttributesW',0
