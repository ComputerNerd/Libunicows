%include "dll_names.inc"

                    global __imp__OpenWaitableTimerW@12
                    global _OpenWaitableTimerW@12
                    global _Unicows_OpenWaitableTimerW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OpenWaitableTimerW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OpenWaitableTimerW@12     ; place to save the pointer
                    push dword [_Unicows_OpenWaitableTimerW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_OpenWaitableTimerW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OpenWaitableTimerW@12]

_OpenWaitableTimerW@12:
                    jmp [__imp__OpenWaitableTimerW@12]


                    section .data

__imp__OpenWaitableTimerW@12:   dd unicows_initial_stub_OpenWaitableTimerW
_Unicows_OpenWaitableTimerW:      dd 0
namestring_OpenWaitableTimerW:    db 'OpenWaitableTimerW',0
