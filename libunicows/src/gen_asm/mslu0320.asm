%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__EndUpdateResourceA@8
                    global EndUpdateResourceA
                    global _EndUpdateResourceA@8
                    global _Unicows_EndUpdateResourceA
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EndUpdateResourceA:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EndUpdateResourceA@8     ; place to save the pointer
                    push dword [_Unicows_EndUpdateResourceA]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_EndUpdateResourceA      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EndUpdateResourceA:
_EndUpdateResourceA@8:
                    jmp [__imp__EndUpdateResourceA@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EndUpdateResourceA@8:   dd unicows_initial_stub_EndUpdateResourceA
_Unicows_EndUpdateResourceA:      dd 0
namestring_EndUpdateResourceA:    db 'EndUpdateResourceA',0
