%include "dll_names.inc"

                    global __imp__GetKeyNameTextW@12
                    global GetKeyNameTextW
                    global _GetKeyNameTextW@12
                    global _Unicows_GetKeyNameTextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetKeyNameTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetKeyNameTextW@12     ; place to save the pointer
                    push dword [_Unicows_GetKeyNameTextW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetKeyNameTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetKeyNameTextW:
_GetKeyNameTextW@12:
                    jmp [__imp__GetKeyNameTextW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetKeyNameTextW@12:   dd unicows_initial_stub_GetKeyNameTextW
_Unicows_GetKeyNameTextW:      dd 0
namestring_GetKeyNameTextW:    db 'GetKeyNameTextW',0
