%include "dll_names.inc"

                    global __imp__SetWindowLongW@12
                    global SetWindowLongW
                    global _SetWindowLongW@12
                    global _Unicows_SetWindowLongW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetWindowLongW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetWindowLongW@12     ; place to save the pointer
                    push dword [_Unicows_SetWindowLongW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetWindowLongW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetWindowLongW:
_SetWindowLongW@12:
                    jmp [__imp__SetWindowLongW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetWindowLongW@12:   dd unicows_initial_stub_SetWindowLongW
_Unicows_SetWindowLongW:      dd 0
namestring_SetWindowLongW:    db 'SetWindowLongW',0
