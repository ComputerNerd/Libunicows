%include "dll_names.inc"

                    global __imp__ModifyMenuW@20
                    global ModifyMenuW
                    global _ModifyMenuW@20
                    global _Unicows_ModifyMenuW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ModifyMenuW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ModifyMenuW@20     ; place to save the pointer
                    push dword [_Unicows_ModifyMenuW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_ModifyMenuW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ModifyMenuW:
_ModifyMenuW@20:
                    jmp [__imp__ModifyMenuW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ModifyMenuW@20:   dd unicows_initial_stub_ModifyMenuW
_Unicows_ModifyMenuW:      dd 0
namestring_ModifyMenuW:    db 'ModifyMenuW',0
