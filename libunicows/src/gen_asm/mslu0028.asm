%include "dll_names.inc"

                    global __imp__CreateICW@16
                    global CreateICW
                    global _CreateICW@16
                    global _Unicows_CreateICW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateICW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateICW@16     ; place to save the pointer
                    push dword [_Unicows_CreateICW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_CreateICW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateICW:
_CreateICW@16:
                    jmp [__imp__CreateICW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateICW@16:   dd unicows_initial_stub_CreateICW
_Unicows_CreateICW:      dd 0
namestring_CreateICW:    db 'CreateICW',0
