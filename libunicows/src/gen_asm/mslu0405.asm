%include "dll_names.inc"

                    global __imp__WaitNamedPipeW@8
                    global _WaitNamedPipeW@8
                    global _Unicows_WaitNamedPipeW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WaitNamedPipeW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WaitNamedPipeW@8     ; place to save the pointer
                    push dword [_Unicows_WaitNamedPipeW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WaitNamedPipeW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WaitNamedPipeW@8]

_WaitNamedPipeW@8:
                    jmp [__imp__WaitNamedPipeW@8]


                    section .data

__imp__WaitNamedPipeW@8:   dd unicows_initial_stub_WaitNamedPipeW
_Unicows_WaitNamedPipeW:      dd 0
namestring_WaitNamedPipeW:    db 'WaitNamedPipeW',0
