%include "dll_names.inc"

                    global __imp__MessageBoxW@16
                    global MessageBoxW
                    global _MessageBoxW@16
                    global _Unicows_MessageBoxW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_MessageBoxW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MessageBoxW@16     ; place to save the pointer
                    push dword [_Unicows_MessageBoxW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_MessageBoxW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

MessageBoxW:
_MessageBoxW@16:
                    jmp [__imp__MessageBoxW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__MessageBoxW@16:   dd unicows_initial_stub_MessageBoxW
_Unicows_MessageBoxW:      dd 0
namestring_MessageBoxW:    db 'MessageBoxW',0
