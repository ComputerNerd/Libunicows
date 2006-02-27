%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__SendMessageTimeoutW@28
                    global SendMessageTimeoutW
                    global _SendMessageTimeoutW@28
                    global _Unicows_SendMessageTimeoutW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SendMessageTimeoutW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SendMessageTimeoutW@28     ; place to save the pointer
                    push dword [_Unicows_SendMessageTimeoutW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SendMessageTimeoutW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SendMessageTimeoutW:
_SendMessageTimeoutW@28:
                    jmp [__imp__SendMessageTimeoutW@28]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SendMessageTimeoutW@28:   dd unicows_initial_stub_SendMessageTimeoutW
_Unicows_SendMessageTimeoutW:      dd 0
namestring_SendMessageTimeoutW:    db 'SendMessageTimeoutW',0