%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__OpenSemaphoreW@12
                    global OpenSemaphoreW
                    global _OpenSemaphoreW@12
                    global _Unicows_OpenSemaphoreW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OpenSemaphoreW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OpenSemaphoreW@12     ; place to save the pointer
                    push dword [_Unicows_OpenSemaphoreW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_OpenSemaphoreW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OpenSemaphoreW:
_OpenSemaphoreW@12:
                    jmp [__imp__OpenSemaphoreW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OpenSemaphoreW@12:   dd unicows_initial_stub_OpenSemaphoreW
_Unicows_OpenSemaphoreW:      dd 0
namestring_OpenSemaphoreW:    db 'OpenSemaphoreW',0
