%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__UpdateResourceA@24
                    global UpdateResourceA
                    global _UpdateResourceA@24
                    global _Unicows_UpdateResourceA
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_UpdateResourceA:
                    ; Load the symbol...
                    pusha
                    push dword __imp__UpdateResourceA@24     ; place to save the pointer
                    push dword [_Unicows_UpdateResourceA]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_UpdateResourceA      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

UpdateResourceA:
_UpdateResourceA@24:
                    jmp [__imp__UpdateResourceA@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__UpdateResourceA@24:   dd unicows_initial_stub_UpdateResourceA
_Unicows_UpdateResourceA:      dd 0
namestring_UpdateResourceA:    db 'UpdateResourceA',0
