%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetCPInfoExW@12
                    global GetCPInfoExW
                    global _GetCPInfoExW@12
                    global _Unicows_GetCPInfoExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetCPInfoExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCPInfoExW@12     ; place to save the pointer
                    push dword [_Unicows_GetCPInfoExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetCPInfoExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetCPInfoExW:
_GetCPInfoExW@12:
                    jmp [__imp__GetCPInfoExW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetCPInfoExW@12:   dd unicows_initial_stub_GetCPInfoExW
_Unicows_GetCPInfoExW:      dd 0
namestring_GetCPInfoExW:    db 'GetCPInfoExW',0
