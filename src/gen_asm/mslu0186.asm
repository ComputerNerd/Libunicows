%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__LoadAcceleratorsW@8
                    global LoadAcceleratorsW
                    global _LoadAcceleratorsW@8
                    global _Unicows_LoadAcceleratorsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_LoadAcceleratorsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadAcceleratorsW@8     ; place to save the pointer
                    push dword [_Unicows_LoadAcceleratorsW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadAcceleratorsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

LoadAcceleratorsW:
_LoadAcceleratorsW@8:
                    jmp [__imp__LoadAcceleratorsW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__LoadAcceleratorsW@8:   dd unicows_initial_stub_LoadAcceleratorsW
_Unicows_LoadAcceleratorsW:      dd 0
namestring_LoadAcceleratorsW:    db 'LoadAcceleratorsW',0
