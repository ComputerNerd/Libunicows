%include "dll_names.inc"

                    global __imp__WritePrivateProfileStructW@20
                    global WritePrivateProfileStructW
                    global _WritePrivateProfileStructW@20
                    global _Unicows_WritePrivateProfileStructW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WritePrivateProfileStructW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WritePrivateProfileStructW@20     ; place to save the pointer
                    push dword [_Unicows_WritePrivateProfileStructW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WritePrivateProfileStructW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WritePrivateProfileStructW:
_WritePrivateProfileStructW@20:
                    jmp [__imp__WritePrivateProfileStructW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WritePrivateProfileStructW@20:   dd unicows_initial_stub_WritePrivateProfileStructW
_Unicows_WritePrivateProfileStructW:      dd 0
namestring_WritePrivateProfileStructW:    db 'WritePrivateProfileStructW',0
