%include "dll_names.inc"

                    global __imp__WriteConsoleOutputW@20
                    global WriteConsoleOutputW
                    global _WriteConsoleOutputW@20
                    global _Unicows_WriteConsoleOutputW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WriteConsoleOutputW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WriteConsoleOutputW@20     ; place to save the pointer
                    push dword [_Unicows_WriteConsoleOutputW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WriteConsoleOutputW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WriteConsoleOutputW:
_WriteConsoleOutputW@20:
                    jmp [__imp__WriteConsoleOutputW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WriteConsoleOutputW@20:   dd unicows_initial_stub_WriteConsoleOutputW
_Unicows_WriteConsoleOutputW:      dd 0
namestring_WriteConsoleOutputW:    db 'WriteConsoleOutputW',0
