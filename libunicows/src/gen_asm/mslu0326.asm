%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__EnumSystemCodePagesW@8
                    global EnumSystemCodePagesW
                    global _EnumSystemCodePagesW@8
                    global _Unicows_EnumSystemCodePagesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumSystemCodePagesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumSystemCodePagesW@8     ; place to save the pointer
                    push dword [_Unicows_EnumSystemCodePagesW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_EnumSystemCodePagesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumSystemCodePagesW:
_EnumSystemCodePagesW@8:
                    jmp [__imp__EnumSystemCodePagesW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumSystemCodePagesW@8:   dd unicows_initial_stub_EnumSystemCodePagesW
_Unicows_EnumSystemCodePagesW:      dd 0
namestring_EnumSystemCodePagesW:    db 'EnumSystemCodePagesW',0
