%include "dll_names.inc"

                    global __imp__IsCharUpperW@4
                    global IsCharUpperW
                    global _IsCharUpperW@4
                    global _Unicows_IsCharUpperW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_IsCharUpperW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsCharUpperW@4     ; place to save the pointer
                    push dword [_Unicows_IsCharUpperW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_IsCharUpperW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

IsCharUpperW:
_IsCharUpperW@4:
                    jmp [__imp__IsCharUpperW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__IsCharUpperW@4:   dd unicows_initial_stub_IsCharUpperW
_Unicows_IsCharUpperW:      dd 0
namestring_IsCharUpperW:    db 'IsCharUpperW',0
