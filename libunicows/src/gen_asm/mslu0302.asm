%include "dll_names.inc"

                    global __imp__CreateFileW@28
                    global CreateFileW
                    global _CreateFileW@28
                    global _Unicows_CreateFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateFileW@28     ; place to save the pointer
                    push dword [_Unicows_CreateFileW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateFileW:
_CreateFileW@28:
                    jmp [__imp__CreateFileW@28]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateFileW@28:   dd unicows_initial_stub_CreateFileW
_Unicows_CreateFileW:      dd 0
namestring_CreateFileW:    db 'CreateFileW',0
