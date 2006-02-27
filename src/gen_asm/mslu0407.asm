%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__ReadConsoleW@20
                    global ReadConsoleW
                    global _ReadConsoleW@20
                    global _Unicows_ReadConsoleW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ReadConsoleW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ReadConsoleW@20     ; place to save the pointer
                    push dword [_Unicows_ReadConsoleW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_ReadConsoleW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ReadConsoleW:
_ReadConsoleW@20:
                    jmp [__imp__ReadConsoleW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ReadConsoleW@20:   dd unicows_initial_stub_ReadConsoleW
_Unicows_ReadConsoleW:      dd 0
namestring_ReadConsoleW:    db 'ReadConsoleW',0
