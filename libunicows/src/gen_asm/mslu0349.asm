%include "dll_names.inc"

                    global __imp__GetNamedPipeHandleStateW@28
                    global _GetNamedPipeHandleStateW@28
                    global _Unicows_GetNamedPipeHandleStateW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetNamedPipeHandleStateW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetNamedPipeHandleStateW@28     ; place to save the pointer
                    push dword [_Unicows_GetNamedPipeHandleStateW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetNamedPipeHandleStateW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetNamedPipeHandleStateW@28]

_GetNamedPipeHandleStateW@28:
                    jmp [__imp__GetNamedPipeHandleStateW@28]


                    section .data

__imp__GetNamedPipeHandleStateW@28:   dd unicows_initial_stub_GetNamedPipeHandleStateW
_Unicows_GetNamedPipeHandleStateW:      dd 0
namestring_GetNamedPipeHandleStateW:    db 'GetNamedPipeHandleStateW',0
