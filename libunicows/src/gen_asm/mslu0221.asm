%include "dll_names.inc"

                    global __imp__SetPropA@12
                    global SetPropA
                    global _SetPropA@12
                    global _Unicows_SetPropA
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetPropA:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetPropA@12     ; place to save the pointer
                    push dword [_Unicows_SetPropA]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetPropA      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetPropA:
_SetPropA@12:
                    jmp [__imp__SetPropA@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetPropA@12:   dd unicows_initial_stub_SetPropA
_Unicows_SetPropA:      dd 0
namestring_SetPropA:    db 'SetPropA',0
