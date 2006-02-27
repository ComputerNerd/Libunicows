%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetWindowTextLengthW@4
                    global GetWindowTextLengthW
                    global _GetWindowTextLengthW@4
                    global _Unicows_GetWindowTextLengthW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetWindowTextLengthW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetWindowTextLengthW@4     ; place to save the pointer
                    push dword [_Unicows_GetWindowTextLengthW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetWindowTextLengthW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetWindowTextLengthW:
_GetWindowTextLengthW@4:
                    jmp [__imp__GetWindowTextLengthW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetWindowTextLengthW@4:   dd unicows_initial_stub_GetWindowTextLengthW
_Unicows_GetWindowTextLengthW:      dd 0
namestring_GetWindowTextLengthW:    db 'GetWindowTextLengthW',0
