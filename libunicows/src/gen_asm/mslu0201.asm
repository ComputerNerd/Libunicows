%include "dll_names.inc"

                    global __imp__OemToCharBuffW@12
                    global OemToCharBuffW
                    global _OemToCharBuffW@12
                    global _Unicows_OemToCharBuffW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OemToCharBuffW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OemToCharBuffW@12     ; place to save the pointer
                    push dword [_Unicows_OemToCharBuffW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_OemToCharBuffW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OemToCharBuffW:
_OemToCharBuffW@12:
                    jmp [__imp__OemToCharBuffW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OemToCharBuffW@12:   dd unicows_initial_stub_OemToCharBuffW
_Unicows_OemToCharBuffW:      dd 0
namestring_OemToCharBuffW:    db 'OemToCharBuffW',0
