%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__EndUpdateResourceW@8
                    global EndUpdateResourceW
                    global _EndUpdateResourceW@8
                    global _Unicows_EndUpdateResourceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EndUpdateResourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EndUpdateResourceW@8     ; place to save the pointer
                    push dword [_Unicows_EndUpdateResourceW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_EndUpdateResourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EndUpdateResourceW:
_EndUpdateResourceW@8:
                    jmp [__imp__EndUpdateResourceW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EndUpdateResourceW@8:   dd unicows_initial_stub_EndUpdateResourceW
_Unicows_EndUpdateResourceW:      dd 0
namestring_EndUpdateResourceW:    db 'EndUpdateResourceW',0