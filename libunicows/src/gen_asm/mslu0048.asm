%include "dll_names.inc"

                    global __imp__GetObjectW@12
                    global _GetObjectW@12
                    global _Unicows_GetObjectW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetObjectW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetObjectW@12     ; place to save the pointer
                    push dword [_Unicows_GetObjectW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetObjectW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetObjectW@12]

_GetObjectW@12:
                    jmp [__imp__GetObjectW@12]


                    section .data

__imp__GetObjectW@12:   dd unicows_initial_stub_GetObjectW
_Unicows_GetObjectW:      dd 0
namestring_GetObjectW:    db 'GetObjectW',0
