%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__OpenEventW@12
                    global OpenEventW
                    global _OpenEventW@12
                    global _Unicows_OpenEventW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OpenEventW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OpenEventW@12     ; place to save the pointer
                    push dword [_Unicows_OpenEventW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_OpenEventW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OpenEventW:
_OpenEventW@12:
                    jmp [__imp__OpenEventW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OpenEventW@12:   dd unicows_initial_stub_OpenEventW
_Unicows_OpenEventW:      dd 0
namestring_OpenEventW:    db 'OpenEventW',0