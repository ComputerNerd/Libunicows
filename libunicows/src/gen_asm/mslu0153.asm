%include "dll_names.inc"

                    global __imp__GetAltTabInfoW@20
                    global _GetAltTabInfoW@20
                    global _Unicows_GetAltTabInfoW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetAltTabInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetAltTabInfoW@20     ; place to save the pointer
                    push dword [_Unicows_GetAltTabInfoW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetAltTabInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetAltTabInfoW@20]

_GetAltTabInfoW@20:
                    jmp [__imp__GetAltTabInfoW@20]


                    section .data

__imp__GetAltTabInfoW@20:   dd unicows_initial_stub_GetAltTabInfoW
_Unicows_GetAltTabInfoW:      dd 0
namestring_GetAltTabInfoW:    db 'GetAltTabInfoW',0
