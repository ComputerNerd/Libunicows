%include "dll_names.inc"

                    global __imp__WriteConsoleW@20
                    global WriteConsoleW
                    global _WriteConsoleW@20
                    global _Unicows_WriteConsoleW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WriteConsoleW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WriteConsoleW@20     ; place to save the pointer
                    push dword [_Unicows_WriteConsoleW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WriteConsoleW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WriteConsoleW:
_WriteConsoleW@20:
                    jmp [__imp__WriteConsoleW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WriteConsoleW@20:   dd unicows_initial_stub_WriteConsoleW
_Unicows_WriteConsoleW:      dd 0
namestring_WriteConsoleW:    db 'WriteConsoleW',0
