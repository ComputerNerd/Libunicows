%include "dll_names.inc"

                    global __imp__CreateSemaphoreW@16
                    global CreateSemaphoreW
                    global _CreateSemaphoreW@16
                    global _Unicows_CreateSemaphoreW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateSemaphoreW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateSemaphoreW@16     ; place to save the pointer
                    push dword [_Unicows_CreateSemaphoreW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateSemaphoreW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateSemaphoreW:
_CreateSemaphoreW@16:
                    jmp [__imp__CreateSemaphoreW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateSemaphoreW@16:   dd unicows_initial_stub_CreateSemaphoreW
_Unicows_CreateSemaphoreW:      dd 0
namestring_CreateSemaphoreW:    db 'CreateSemaphoreW',0
