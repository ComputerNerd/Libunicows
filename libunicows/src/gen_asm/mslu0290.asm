%include "dll_names.inc"

                    global __imp__CallNamedPipeW@28
                    global _CallNamedPipeW@28
                    global _Unicows_CallNamedPipeW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CallNamedPipeW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CallNamedPipeW@28     ; place to save the pointer
                    push dword [_Unicows_CallNamedPipeW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CallNamedPipeW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CallNamedPipeW@28]

_CallNamedPipeW@28:
                    jmp [__imp__CallNamedPipeW@28]


                    section .data

__imp__CallNamedPipeW@28:   dd unicows_initial_stub_CallNamedPipeW
_Unicows_CallNamedPipeW:      dd 0
namestring_CallNamedPipeW:    db 'CallNamedPipeW',0
