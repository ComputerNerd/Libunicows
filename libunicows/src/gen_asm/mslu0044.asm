%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetICMProfileW@12
                    global GetICMProfileW
                    global _GetICMProfileW@12
                    global _Unicows_GetICMProfileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetICMProfileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetICMProfileW@12     ; place to save the pointer
                    push dword [_Unicows_GetICMProfileW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetICMProfileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetICMProfileW:
_GetICMProfileW@12:
                    jmp [__imp__GetICMProfileW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetICMProfileW@12:   dd unicows_initial_stub_GetICMProfileW
_Unicows_GetICMProfileW:      dd 0
namestring_GetICMProfileW:    db 'GetICMProfileW',0
