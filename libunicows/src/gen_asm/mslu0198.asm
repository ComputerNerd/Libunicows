%include "dll_names.inc"

                    global __imp__MessageBoxIndirectW@4
                    global MessageBoxIndirectW
                    global _MessageBoxIndirectW@4
                    global _Unicows_MessageBoxIndirectW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_MessageBoxIndirectW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MessageBoxIndirectW@4     ; place to save the pointer
                    push dword [_Unicows_MessageBoxIndirectW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_MessageBoxIndirectW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

MessageBoxIndirectW:
_MessageBoxIndirectW@4:
                    jmp [__imp__MessageBoxIndirectW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__MessageBoxIndirectW@4:   dd unicows_initial_stub_MessageBoxIndirectW
_Unicows_MessageBoxIndirectW:      dd 0
namestring_MessageBoxIndirectW:    db 'MessageBoxIndirectW',0
