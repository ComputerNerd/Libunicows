%include "dll_names.inc"

                    global __imp__CreateWaitableTimerW@12
                    global _CreateWaitableTimerW@12
                    global _Unicows_CreateWaitableTimerW
                  
                    extern _LoadUnicowsSymbol

                    section .text

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

                    ; ...and skip to it
                    jmp [__imp__CreateWaitableTimerW@12]

_CreateWaitableTimerW@12:
                    jmp [__imp__CreateWaitableTimerW@12]


                    section .data

__imp__CreateWaitableTimerW@12:   dd unicows_initial_stub_CreateWaitableTimerW
_Unicows_CreateWaitableTimerW:      dd 0
namestring_CreateWaitableTimerW:    db 'CreateWaitableTimerW',0
