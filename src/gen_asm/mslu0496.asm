%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__IsDestinationReachableW@8
                    global IsDestinationReachableW
                    global _IsDestinationReachableW@8
                    global _Unicows_IsDestinationReachableW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_IsDestinationReachableW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsDestinationReachableW@8     ; place to save the pointer
                    push dword [_Unicows_IsDestinationReachableW]      ; default proc, if any
                    push dword SENSAPI                  ; dll id
                    push dword namestring_IsDestinationReachableW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

IsDestinationReachableW:
_IsDestinationReachableW@8:
                    jmp [__imp__IsDestinationReachableW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__IsDestinationReachableW@8:   dd unicows_initial_stub_IsDestinationReachableW
_Unicows_IsDestinationReachableW:      dd 0
namestring_IsDestinationReachableW:    db 'IsDestinationReachableW',0
