%include "dll_names.inc"

                    global __imp__GetClassInfoW@12
                    global _GetClassInfoW@12
                    global _Unicows_GetClassInfoW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetClassInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetClassInfoW@12     ; place to save the pointer
                    push dword [_Unicows_GetClassInfoW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetClassInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetClassInfoW@12]

_GetClassInfoW@12:
                    jmp [__imp__GetClassInfoW@12]


                    section .data

__imp__GetClassInfoW@12:   dd unicows_initial_stub_GetClassInfoW
_Unicows_GetClassInfoW:      dd 0
namestring_GetClassInfoW:    db 'GetClassInfoW',0
