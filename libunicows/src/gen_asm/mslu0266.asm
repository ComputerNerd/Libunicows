%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetCurrentHwProfileW@4
                    global GetCurrentHwProfileW
                    global _GetCurrentHwProfileW@4
                    global _Unicows_GetCurrentHwProfileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetCurrentHwProfileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCurrentHwProfileW@4     ; place to save the pointer
                    push dword [_Unicows_GetCurrentHwProfileW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_GetCurrentHwProfileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetCurrentHwProfileW:
_GetCurrentHwProfileW@4:
                    jmp [__imp__GetCurrentHwProfileW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetCurrentHwProfileW@4:   dd unicows_initial_stub_GetCurrentHwProfileW
_Unicows_GetCurrentHwProfileW:      dd 0
namestring_GetCurrentHwProfileW:    db 'GetCurrentHwProfileW',0
