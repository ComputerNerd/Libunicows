%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetObjectW@12
                    global GetObjectW
                    global _GetObjectW@12
                    global _Unicows_GetObjectW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetObjectW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetObjectW@12     ; place to save the pointer
                    push dword [_Unicows_GetObjectW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetObjectW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetObjectW:
_GetObjectW@12:
                    jmp [__imp__GetObjectW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetObjectW@12:   dd unicows_initial_stub_GetObjectW
_Unicows_GetObjectW:      dd 0
namestring_GetObjectW:    db 'GetObjectW',0
