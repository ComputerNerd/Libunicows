%include "dll_names.inc"

                    global __imp__RegisterClassW@4
                    global RegisterClassW
                    global _RegisterClassW@4
                    global _Unicows_RegisterClassW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegisterClassW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegisterClassW@4     ; place to save the pointer
                    push dword [_Unicows_RegisterClassW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_RegisterClassW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegisterClassW:
_RegisterClassW@4:
                    jmp [__imp__RegisterClassW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegisterClassW@4:   dd unicows_initial_stub_RegisterClassW
_Unicows_RegisterClassW:      dd 0
namestring_RegisterClassW:    db 'RegisterClassW',0
