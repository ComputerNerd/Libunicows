%include "dll_names.inc"

                    global __imp__GetPropW@8
                    global GetPropW
                    global _GetPropW@8
                    global _Unicows_GetPropW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetPropW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPropW@8     ; place to save the pointer
                    push dword [_Unicows_GetPropW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetPropW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetPropW:
_GetPropW@8:
                    jmp [__imp__GetPropW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetPropW@8:   dd unicows_initial_stub_GetPropW
_Unicows_GetPropW:      dd 0
namestring_GetPropW:    db 'GetPropW',0
