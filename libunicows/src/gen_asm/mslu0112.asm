%include "dll_names.inc"

                    global __imp__CharToOemBuffW@12
                    global CharToOemBuffW
                    global _CharToOemBuffW@12
                    global _Unicows_CharToOemBuffW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CharToOemBuffW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CharToOemBuffW@12     ; place to save the pointer
                    push dword [_Unicows_CharToOemBuffW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CharToOemBuffW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CharToOemBuffW:
_CharToOemBuffW@12:
                    jmp [__imp__CharToOemBuffW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CharToOemBuffW@12:   dd unicows_initial_stub_CharToOemBuffW
_Unicows_CharToOemBuffW:      dd 0
namestring_CharToOemBuffW:    db 'CharToOemBuffW',0
