%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CreateEventW@16
                    global CreateEventW
                    global _CreateEventW@16
                    global _Unicows_CreateEventW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateEventW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateEventW@16     ; place to save the pointer
                    push dword [_Unicows_CreateEventW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateEventW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateEventW:
_CreateEventW@16:
                    jmp [__imp__CreateEventW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateEventW@16:   dd unicows_initial_stub_CreateEventW
_Unicows_CreateEventW:      dd 0
namestring_CreateEventW:    db 'CreateEventW',0
