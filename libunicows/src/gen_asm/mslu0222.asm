%include "dll_names.inc"

                    global __imp__SetPropW@12
                    global SetPropW
                    global _SetPropW@12
                    global _Unicows_SetPropW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetPropW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetPropW@12     ; place to save the pointer
                    push dword [_Unicows_SetPropW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetPropW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetPropW:
_SetPropW@12:
                    jmp [__imp__SetPropW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetPropW@12:   dd unicows_initial_stub_SetPropW
_Unicows_SetPropW:      dd 0
namestring_SetPropW:    db 'SetPropW',0
