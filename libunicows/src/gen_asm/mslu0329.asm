%include "dll_names.inc"

                    global __imp__GetAtomNameW@12
                    global GetAtomNameW
                    global _GetAtomNameW@12
                    global _Unicows_GetAtomNameW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetAtomNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetAtomNameW@12     ; place to save the pointer
                    push dword [_Unicows_GetAtomNameW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetAtomNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetAtomNameW:
_GetAtomNameW@12:
                    jmp [__imp__GetAtomNameW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetAtomNameW@12:   dd unicows_initial_stub_GetAtomNameW
_Unicows_GetAtomNameW:      dd 0
namestring_GetAtomNameW:    db 'GetAtomNameW',0
