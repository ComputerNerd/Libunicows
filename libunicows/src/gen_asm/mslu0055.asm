%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__PolyTextOutW@12
                    global PolyTextOutW
                    global _PolyTextOutW@12
                    global _Unicows_PolyTextOutW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_PolyTextOutW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__PolyTextOutW@12     ; place to save the pointer
                    push dword [_Unicows_PolyTextOutW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_PolyTextOutW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

PolyTextOutW:
_PolyTextOutW@12:
                    jmp [__imp__PolyTextOutW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__PolyTextOutW@12:   dd unicows_initial_stub_PolyTextOutW
_Unicows_PolyTextOutW:      dd 0
namestring_PolyTextOutW:    db 'PolyTextOutW',0
