%include "dll_names.inc"

                    global __imp__RemovePropW@8
                    global RemovePropW
                    global _RemovePropW@8
                    global _Unicows_RemovePropW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RemovePropW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RemovePropW@8     ; place to save the pointer
                    push dword [_Unicows_RemovePropW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_RemovePropW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RemovePropW:
_RemovePropW@8:
                    jmp [__imp__RemovePropW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RemovePropW@8:   dd unicows_initial_stub_RemovePropW
_Unicows_RemovePropW:      dd 0
namestring_RemovePropW:    db 'RemovePropW',0
