%include "dll_names.inc"

                    global __imp__CreateWaitableTimerW@12
                    global CreateWaitableTimerW
                    global _CreateWaitableTimerW@12
                    global _Unicows_CreateWaitableTimerW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateWaitableTimerW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateWaitableTimerW@12     ; place to save the pointer
                    push dword [_Unicows_CreateWaitableTimerW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateWaitableTimerW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateWaitableTimerW:
_CreateWaitableTimerW@12:
                    jmp [__imp__CreateWaitableTimerW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateWaitableTimerW@12:   dd unicows_initial_stub_CreateWaitableTimerW
_Unicows_CreateWaitableTimerW:      dd 0
namestring_CreateWaitableTimerW:    db 'CreateWaitableTimerW',0
