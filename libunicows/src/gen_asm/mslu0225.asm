%include "dll_names.inc"

                    global __imp__SetWindowTextW@8
                    global SetWindowTextW
                    global _SetWindowTextW@8
                    global _Unicows_SetWindowTextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetWindowTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetWindowTextW@8     ; place to save the pointer
                    push dword [_Unicows_SetWindowTextW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetWindowTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetWindowTextW:
_SetWindowTextW@8:
                    jmp [__imp__SetWindowTextW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetWindowTextW@8:   dd unicows_initial_stub_SetWindowTextW
_Unicows_SetWindowTextW:      dd 0
namestring_SetWindowTextW:    db 'SetWindowTextW',0
