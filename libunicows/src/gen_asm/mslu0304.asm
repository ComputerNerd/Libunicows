%include "dll_names.inc"

                    global __imp__CreateMutexW@12
                    global CreateMutexW
                    global _CreateMutexW@12
                    global _Unicows_CreateMutexW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateMutexW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateMutexW@12     ; place to save the pointer
                    push dword [_Unicows_CreateMutexW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateMutexW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateMutexW:
_CreateMutexW@12:
                    jmp [__imp__CreateMutexW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateMutexW@12:   dd unicows_initial_stub_CreateMutexW
_Unicows_CreateMutexW:      dd 0
namestring_CreateMutexW:    db 'CreateMutexW',0
