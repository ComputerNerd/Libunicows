%include "dll_names.inc"

                    global __imp__SetDefaultCommConfigW@12
                    global SetDefaultCommConfigW
                    global _SetDefaultCommConfigW@12
                    global _Unicows_SetDefaultCommConfigW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetDefaultCommConfigW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetDefaultCommConfigW@12     ; place to save the pointer
                    push dword [_Unicows_SetDefaultCommConfigW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SetDefaultCommConfigW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetDefaultCommConfigW:
_SetDefaultCommConfigW@12:
                    jmp [__imp__SetDefaultCommConfigW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetDefaultCommConfigW@12:   dd unicows_initial_stub_SetDefaultCommConfigW
_Unicows_SetDefaultCommConfigW:      dd 0
namestring_SetDefaultCommConfigW:    db 'SetDefaultCommConfigW',0
