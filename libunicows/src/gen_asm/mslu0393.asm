%include "dll_names.inc"

                    global __imp__ReadConsoleOutputCharacterW@20
                    global ReadConsoleOutputCharacterW
                    global _ReadConsoleOutputCharacterW@20
                    global _Unicows_ReadConsoleOutputCharacterW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ReadConsoleOutputCharacterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ReadConsoleOutputCharacterW@20     ; place to save the pointer
                    push dword [_Unicows_ReadConsoleOutputCharacterW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_ReadConsoleOutputCharacterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ReadConsoleOutputCharacterW:
_ReadConsoleOutputCharacterW@20:
                    jmp [__imp__ReadConsoleOutputCharacterW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ReadConsoleOutputCharacterW@20:   dd unicows_initial_stub_ReadConsoleOutputCharacterW
_Unicows_ReadConsoleOutputCharacterW:      dd 0
namestring_ReadConsoleOutputCharacterW:    db 'ReadConsoleOutputCharacterW',0
