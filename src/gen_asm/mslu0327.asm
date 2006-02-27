%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__EnumSystemLocalesW@8
                    global EnumSystemLocalesW
                    global _EnumSystemLocalesW@8
                    global _Unicows_EnumSystemLocalesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumSystemLocalesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumSystemLocalesW@8     ; place to save the pointer
                    push dword [_Unicows_EnumSystemLocalesW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_EnumSystemLocalesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumSystemLocalesW:
_EnumSystemLocalesW@8:
                    jmp [__imp__EnumSystemLocalesW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumSystemLocalesW@8:   dd unicows_initial_stub_EnumSystemLocalesW
_Unicows_EnumSystemLocalesW:      dd 0
namestring_EnumSystemLocalesW:    db 'EnumSystemLocalesW',0
