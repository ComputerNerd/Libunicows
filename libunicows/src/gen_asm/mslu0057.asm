%include "dll_names.inc"

                    global __imp__ResetDCW@8
                    global ResetDCW
                    global _ResetDCW@8
                    global _Unicows_ResetDCW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ResetDCW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ResetDCW@8     ; place to save the pointer
                    push dword [_Unicows_ResetDCW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_ResetDCW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ResetDCW:
_ResetDCW@8:
                    jmp [__imp__ResetDCW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ResetDCW@8:   dd unicows_initial_stub_ResetDCW
_Unicows_ResetDCW:      dd 0
namestring_ResetDCW:    db 'ResetDCW',0
