%include "dll_names.inc"

                    global __imp__SetICMProfileW@8
                    global SetICMProfileW
                    global _SetICMProfileW@8
                    global _Unicows_SetICMProfileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetICMProfileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetICMProfileW@8     ; place to save the pointer
                    push dword [_Unicows_SetICMProfileW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_SetICMProfileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetICMProfileW:
_SetICMProfileW@8:
                    jmp [__imp__SetICMProfileW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetICMProfileW@8:   dd unicows_initial_stub_SetICMProfileW
_Unicows_SetICMProfileW:      dd 0
namestring_SetICMProfileW:    db 'SetICMProfileW',0
