%include "dll_names.inc"

                    global __imp__GlobalGetAtomNameW@12
                    global GlobalGetAtomNameW
                    global _GlobalGetAtomNameW@12
                    global _Unicows_GlobalGetAtomNameW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GlobalGetAtomNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GlobalGetAtomNameW@12     ; place to save the pointer
                    push dword [_Unicows_GlobalGetAtomNameW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GlobalGetAtomNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GlobalGetAtomNameW:
_GlobalGetAtomNameW@12:
                    jmp [__imp__GlobalGetAtomNameW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GlobalGetAtomNameW@12:   dd unicows_initial_stub_GlobalGetAtomNameW
_Unicows_GlobalGetAtomNameW:      dd 0
namestring_GlobalGetAtomNameW:    db 'GlobalGetAtomNameW',0
