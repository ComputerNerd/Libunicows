%include "dll_names.inc"

                    global __imp__GetClassNameW@12
                    global _GetClassNameW@12
                    global _Unicows_GetClassNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetClassNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetClassNameW@12     ; place to save the pointer
                    push dword [_Unicows_GetClassNameW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetClassNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetClassNameW@12]

_GetClassNameW@12:
                    jmp [__imp__GetClassNameW@12]


                    section .data

__imp__GetClassNameW@12:   dd unicows_initial_stub_GetClassNameW
_Unicows_GetClassNameW:      dd 0
namestring_GetClassNameW:    db 'GetClassNameW',0
