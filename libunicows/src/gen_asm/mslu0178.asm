%include "dll_names.inc"

                    global __imp__IsCharAlphaNumericW@4
                    global IsCharAlphaNumericW
                    global _IsCharAlphaNumericW@4
                    global _Unicows_IsCharAlphaNumericW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_IsCharAlphaNumericW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsCharAlphaNumericW@4     ; place to save the pointer
                    push dword [_Unicows_IsCharAlphaNumericW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_IsCharAlphaNumericW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

IsCharAlphaNumericW:
_IsCharAlphaNumericW@4:
                    jmp [__imp__IsCharAlphaNumericW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__IsCharAlphaNumericW@4:   dd unicows_initial_stub_IsCharAlphaNumericW
_Unicows_IsCharAlphaNumericW:      dd 0
namestring_IsCharAlphaNumericW:    db 'IsCharAlphaNumericW',0
