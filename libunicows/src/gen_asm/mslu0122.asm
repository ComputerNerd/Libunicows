%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CreateWindowExW@48
                    global CreateWindowExW
                    global _CreateWindowExW@48
                    global _Unicows_CreateWindowExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateWindowExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateWindowExW@48     ; place to save the pointer
                    push dword [_Unicows_CreateWindowExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CreateWindowExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateWindowExW:
_CreateWindowExW@48:
                    jmp [__imp__CreateWindowExW@48]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateWindowExW@48:   dd unicows_initial_stub_CreateWindowExW
_Unicows_CreateWindowExW:      dd 0
namestring_CreateWindowExW:    db 'CreateWindowExW',0
