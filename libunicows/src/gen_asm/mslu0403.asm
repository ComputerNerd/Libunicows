%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__ReadConsoleInputW@16
                    global ReadConsoleInputW
                    global _ReadConsoleInputW@16
                    global _Unicows_ReadConsoleInputW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ReadConsoleInputW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ReadConsoleInputW@16     ; place to save the pointer
                    push dword [_Unicows_ReadConsoleInputW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_ReadConsoleInputW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ReadConsoleInputW:
_ReadConsoleInputW@16:
                    jmp [__imp__ReadConsoleInputW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ReadConsoleInputW@16:   dd unicows_initial_stub_ReadConsoleInputW
_Unicows_ReadConsoleInputW:      dd 0
namestring_ReadConsoleInputW:    db 'ReadConsoleInputW',0
