%include "dll_names.inc"

                    global __imp__CreateProcessW@40
                    global CreateProcessW
                    global _CreateProcessW@40
                    global _Unicows_CreateProcessW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateProcessW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateProcessW@40     ; place to save the pointer
                    push dword [_Unicows_CreateProcessW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateProcessW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateProcessW:
_CreateProcessW@40:
                    jmp [__imp__CreateProcessW@40]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateProcessW@40:   dd unicows_initial_stub_CreateProcessW
_Unicows_CreateProcessW:      dd 0
namestring_CreateProcessW:    db 'CreateProcessW',0
