%include "dll_names.inc"

                    global __imp__CharToOemW@8
                    global CharToOemW
                    global _CharToOemW@8
                    global _Unicows_CharToOemW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CharToOemW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CharToOemW@8     ; place to save the pointer
                    push dword [_Unicows_CharToOemW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CharToOemW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CharToOemW:
_CharToOemW@8:
                    jmp [__imp__CharToOemW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CharToOemW@8:   dd unicows_initial_stub_CharToOemW
_Unicows_CharToOemW:      dd 0
namestring_CharToOemW:    db 'CharToOemW',0
