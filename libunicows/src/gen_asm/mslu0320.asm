%include "dll_names.inc"

                    global __imp__FillConsoleOutputCharacterW@20
                    global FillConsoleOutputCharacterW
                    global _FillConsoleOutputCharacterW@20
                    global _Unicows_FillConsoleOutputCharacterW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_FillConsoleOutputCharacterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FillConsoleOutputCharacterW@20     ; place to save the pointer
                    push dword [_Unicows_FillConsoleOutputCharacterW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_FillConsoleOutputCharacterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

FillConsoleOutputCharacterW:
_FillConsoleOutputCharacterW@20:
                    jmp [__imp__FillConsoleOutputCharacterW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__FillConsoleOutputCharacterW@20:   dd unicows_initial_stub_FillConsoleOutputCharacterW
_Unicows_FillConsoleOutputCharacterW:      dd 0
namestring_FillConsoleOutputCharacterW:    db 'FillConsoleOutputCharacterW',0
