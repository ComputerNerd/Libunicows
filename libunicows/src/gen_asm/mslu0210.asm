%include "dll_names.inc"

                    global __imp__RegisterWindowMessageW@4
                    global RegisterWindowMessageW
                    global _RegisterWindowMessageW@4
                    global _Unicows_RegisterWindowMessageW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegisterWindowMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegisterWindowMessageW@4     ; place to save the pointer
                    push dword [_Unicows_RegisterWindowMessageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_RegisterWindowMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegisterWindowMessageW:
_RegisterWindowMessageW@4:
                    jmp [__imp__RegisterWindowMessageW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegisterWindowMessageW@4:   dd unicows_initial_stub_RegisterWindowMessageW
_Unicows_RegisterWindowMessageW:      dd 0
namestring_RegisterWindowMessageW:    db 'RegisterWindowMessageW',0
