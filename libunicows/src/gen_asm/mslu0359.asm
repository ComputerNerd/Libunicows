%include "dll_names.inc"

                    global __imp__GetProfileIntW@12
                    global _GetProfileIntW@12
                    global _Unicows_GetProfileIntW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetProfileIntW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetProfileIntW@12     ; place to save the pointer
                    push dword [_Unicows_GetProfileIntW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetProfileIntW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetProfileIntW@12]

_GetProfileIntW@12:
                    jmp [__imp__GetProfileIntW@12]


                    section .data

__imp__GetProfileIntW@12:   dd unicows_initial_stub_GetProfileIntW
_Unicows_GetProfileIntW:      dd 0
namestring_GetProfileIntW:    db 'GetProfileIntW',0
