%include "dll_names.inc"

                    global __imp__GetMenuStringW@20
                    global _GetMenuStringW@20
                    global _Unicows_GetMenuStringW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetMenuStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetMenuStringW@20     ; place to save the pointer
                    push dword [_Unicows_GetMenuStringW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetMenuStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetMenuStringW@20]

_GetMenuStringW@20:
                    jmp [__imp__GetMenuStringW@20]


                    section .data

__imp__GetMenuStringW@20:   dd unicows_initial_stub_GetMenuStringW
_Unicows_GetMenuStringW:      dd 0
namestring_GetMenuStringW:    db 'GetMenuStringW',0
