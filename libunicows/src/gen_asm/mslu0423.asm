%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WriteConsoleInputW@16
                    global WriteConsoleInputW
                    global _WriteConsoleInputW@16
                    global _Unicows_WriteConsoleInputW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WriteConsoleInputW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WriteConsoleInputW@16     ; place to save the pointer
                    push dword [_Unicows_WriteConsoleInputW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WriteConsoleInputW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WriteConsoleInputW:
_WriteConsoleInputW@16:
                    jmp [__imp__WriteConsoleInputW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WriteConsoleInputW@16:   dd unicows_initial_stub_WriteConsoleInputW
_Unicows_WriteConsoleInputW:      dd 0
namestring_WriteConsoleInputW:    db 'WriteConsoleInputW',0
