%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__EnumDateFormatsExW@12
                    global EnumDateFormatsExW
                    global _EnumDateFormatsExW@12
                    global _Unicows_EnumDateFormatsExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumDateFormatsExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumDateFormatsExW@12     ; place to save the pointer
                    push dword [_Unicows_EnumDateFormatsExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_EnumDateFormatsExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumDateFormatsExW:
_EnumDateFormatsExW@12:
                    jmp [__imp__EnumDateFormatsExW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumDateFormatsExW@12:   dd unicows_initial_stub_EnumDateFormatsExW
_Unicows_EnumDateFormatsExW:      dd 0
namestring_EnumDateFormatsExW:    db 'EnumDateFormatsExW',0
