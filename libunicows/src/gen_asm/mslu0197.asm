%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__MessageBoxExW@20
                    global MessageBoxExW
                    global _MessageBoxExW@20
                    global _Unicows_MessageBoxExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_MessageBoxExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MessageBoxExW@20     ; place to save the pointer
                    push dword [_Unicows_MessageBoxExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_MessageBoxExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

MessageBoxExW:
_MessageBoxExW@20:
                    jmp [__imp__MessageBoxExW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__MessageBoxExW@20:   dd unicows_initial_stub_MessageBoxExW
_Unicows_MessageBoxExW:      dd 0
namestring_MessageBoxExW:    db 'MessageBoxExW',0
