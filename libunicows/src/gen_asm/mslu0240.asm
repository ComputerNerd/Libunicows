%include "dll_names.inc"

                    global __imp__FindExecutableW@12
                    global FindExecutableW
                    global _FindExecutableW@12
                    global _Unicows_FindExecutableW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_FindExecutableW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindExecutableW@12     ; place to save the pointer
                    push dword [_Unicows_FindExecutableW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_FindExecutableW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

FindExecutableW:
_FindExecutableW@12:
                    jmp [__imp__FindExecutableW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__FindExecutableW@12:   dd unicows_initial_stub_FindExecutableW
_Unicows_FindExecutableW:      dd 0
namestring_FindExecutableW:    db 'FindExecutableW',0
