%include "dll_names.inc"

                    global __imp__GetProfileStringW@20
                    global _GetProfileStringW@20
                    global _Unicows_GetProfileStringW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetProfileStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetProfileStringW@20     ; place to save the pointer
                    push dword [_Unicows_GetProfileStringW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetProfileStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetProfileStringW@20]

_GetProfileStringW@20:
                    jmp [__imp__GetProfileStringW@20]


                    section .data

__imp__GetProfileStringW@20:   dd unicows_initial_stub_GetProfileStringW
_Unicows_GetProfileStringW:      dd 0
namestring_GetProfileStringW:    db 'GetProfileStringW',0
