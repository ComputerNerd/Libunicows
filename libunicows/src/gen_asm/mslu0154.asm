%include "dll_names.inc"

                    global __imp__GetClassInfoExW@12
                    global _GetClassInfoExW@12
                    global _Unicows_GetClassInfoExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetClassInfoExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetClassInfoExW@12     ; place to save the pointer
                    push dword [_Unicows_GetClassInfoExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetClassInfoExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetClassInfoExW@12]

_GetClassInfoExW@12:
                    jmp [__imp__GetClassInfoExW@12]


                    section .data

__imp__GetClassInfoExW@12:   dd unicows_initial_stub_GetClassInfoExW
_Unicows_GetClassInfoExW:      dd 0
namestring_GetClassInfoExW:    db 'GetClassInfoExW',0
