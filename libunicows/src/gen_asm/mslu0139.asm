%include "dll_names.inc"

                    global __imp__DrawStateW@40
                    global DrawStateW
                    global _DrawStateW@40
                    global _Unicows_DrawStateW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DrawStateW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DrawStateW@40     ; place to save the pointer
                    push dword [_Unicows_DrawStateW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DrawStateW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DrawStateW:
_DrawStateW@40:
                    jmp [__imp__DrawStateW@40]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DrawStateW@40:   dd unicows_initial_stub_DrawStateW
_Unicows_DrawStateW:      dd 0
namestring_DrawStateW:    db 'DrawStateW',0
