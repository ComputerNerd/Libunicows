%include "dll_names.inc"

                    global __imp__CreateNamedPipeW@32
                    global _CreateNamedPipeW@32
                    global _Unicows_CreateNamedPipeW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateNamedPipeW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateNamedPipeW@32     ; place to save the pointer
                    push dword [_Unicows_CreateNamedPipeW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateNamedPipeW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateNamedPipeW@32]

_CreateNamedPipeW@32:
                    jmp [__imp__CreateNamedPipeW@32]


                    section .data

__imp__CreateNamedPipeW@32:   dd unicows_initial_stub_CreateNamedPipeW
_Unicows_CreateNamedPipeW:      dd 0
namestring_CreateNamedPipeW:    db 'CreateNamedPipeW',0
