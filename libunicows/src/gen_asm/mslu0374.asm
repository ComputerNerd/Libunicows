%include "dll_names.inc"

                    global __imp__GlobalAddAtomW@4
                    global GlobalAddAtomW
                    global _GlobalAddAtomW@4
                    global _Unicows_GlobalAddAtomW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GlobalAddAtomW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GlobalAddAtomW@4     ; place to save the pointer
                    push dword [_Unicows_GlobalAddAtomW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GlobalAddAtomW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GlobalAddAtomW:
_GlobalAddAtomW@4:
                    jmp [__imp__GlobalAddAtomW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GlobalAddAtomW@4:   dd unicows_initial_stub_GlobalAddAtomW
_Unicows_GlobalAddAtomW:      dd 0
namestring_GlobalAddAtomW:    db 'GlobalAddAtomW',0
