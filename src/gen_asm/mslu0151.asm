%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__EnumPropsW@8
                    global EnumPropsW
                    global _EnumPropsW@8
                    global _Unicows_EnumPropsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumPropsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPropsW@8     ; place to save the pointer
                    push dword [_Unicows_EnumPropsW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_EnumPropsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumPropsW:
_EnumPropsW@8:
                    jmp [__imp__EnumPropsW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumPropsW@8:   dd unicows_initial_stub_EnumPropsW
_Unicows_EnumPropsW:      dd 0
namestring_EnumPropsW:    db 'EnumPropsW',0
