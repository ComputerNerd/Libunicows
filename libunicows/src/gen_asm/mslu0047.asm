%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetLogColorSpaceW@12
                    global GetLogColorSpaceW
                    global _GetLogColorSpaceW@12
                    global _Unicows_GetLogColorSpaceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetLogColorSpaceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetLogColorSpaceW@12     ; place to save the pointer
                    push dword [_Unicows_GetLogColorSpaceW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetLogColorSpaceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetLogColorSpaceW:
_GetLogColorSpaceW@12:
                    jmp [__imp__GetLogColorSpaceW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetLogColorSpaceW@12:   dd unicows_initial_stub_GetLogColorSpaceW
_Unicows_GetLogColorSpaceW:      dd 0
namestring_GetLogColorSpaceW:    db 'GetLogColorSpaceW',0
