%include "dll_names.inc"

                    global __imp__CharPrevW@8
                    global CharPrevW
                    global _CharPrevW@8
                    global _Unicows_CharPrevW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CharPrevW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CharPrevW@8     ; place to save the pointer
                    push dword [_Unicows_CharPrevW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CharPrevW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CharPrevW:
_CharPrevW@8:
                    jmp [__imp__CharPrevW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CharPrevW@8:   dd unicows_initial_stub_CharPrevW
_Unicows_CharPrevW:      dd 0
namestring_CharPrevW:    db 'CharPrevW',0
