%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GrayStringW@36
                    global GrayStringW
                    global _GrayStringW@36
                    global _Unicows_GrayStringW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GrayStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GrayStringW@36     ; place to save the pointer
                    push dword [_Unicows_GrayStringW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GrayStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GrayStringW:
_GrayStringW@36:
                    jmp [__imp__GrayStringW@36]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GrayStringW@36:   dd unicows_initial_stub_GrayStringW
_Unicows_GrayStringW:      dd 0
namestring_GrayStringW:    db 'GrayStringW',0
