%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetLongPathNameW@12
                    global GetLongPathNameW
                    global _GetLongPathNameW@12
                    global _Unicows_GetLongPathNameW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetLongPathNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetLongPathNameW@12     ; place to save the pointer
                    push dword [_Unicows_GetLongPathNameW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetLongPathNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetLongPathNameW:
_GetLongPathNameW@12:
                    jmp [__imp__GetLongPathNameW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetLongPathNameW@12:   dd unicows_initial_stub_GetLongPathNameW
_Unicows_GetLongPathNameW:      dd 0
namestring_GetLongPathNameW:    db 'GetLongPathNameW',0
