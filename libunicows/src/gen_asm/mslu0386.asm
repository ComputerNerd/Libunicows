%include "dll_names.inc"

                    global __imp__OpenMutexW@12
                    global OpenMutexW
                    global _OpenMutexW@12
                    global _Unicows_OpenMutexW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OpenMutexW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OpenMutexW@12     ; place to save the pointer
                    push dword [_Unicows_OpenMutexW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_OpenMutexW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OpenMutexW:
_OpenMutexW@12:
                    jmp [__imp__OpenMutexW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OpenMutexW@12:   dd unicows_initial_stub_OpenMutexW
_Unicows_OpenMutexW:      dd 0
namestring_OpenMutexW:    db 'OpenMutexW',0
