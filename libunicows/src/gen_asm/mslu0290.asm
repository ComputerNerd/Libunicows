%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__BeginUpdateResourceW@8
                    global BeginUpdateResourceW
                    global _BeginUpdateResourceW@8
                    global _Unicows_BeginUpdateResourceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_BeginUpdateResourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__BeginUpdateResourceW@8     ; place to save the pointer
                    push dword [_Unicows_BeginUpdateResourceW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_BeginUpdateResourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

BeginUpdateResourceW:
_BeginUpdateResourceW@8:
                    jmp [__imp__BeginUpdateResourceW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__BeginUpdateResourceW@8:   dd unicows_initial_stub_BeginUpdateResourceW
_Unicows_BeginUpdateResourceW:      dd 0
namestring_BeginUpdateResourceW:    db 'BeginUpdateResourceW',0
