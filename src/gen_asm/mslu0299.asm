%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__BeginUpdateResourceA@8
                    global BeginUpdateResourceA
                    global _BeginUpdateResourceA@8
                    global _Unicows_BeginUpdateResourceA
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_BeginUpdateResourceA:
                    ; Load the symbol...
                    pusha
                    push dword __imp__BeginUpdateResourceA@8     ; place to save the pointer
                    push dword [_Unicows_BeginUpdateResourceA]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_BeginUpdateResourceA      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

BeginUpdateResourceA:
_BeginUpdateResourceA@8:
                    jmp [__imp__BeginUpdateResourceA@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__BeginUpdateResourceA@8:   dd unicows_initial_stub_BeginUpdateResourceA
_Unicows_BeginUpdateResourceA:      dd 0
namestring_BeginUpdateResourceA:    db 'BeginUpdateResourceA',0
