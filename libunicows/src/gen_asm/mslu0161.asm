%include "dll_names.inc"

                    global __imp__GetKeyNameTextW@12
                    global _GetKeyNameTextW@12
                    global _Unicows_GetKeyNameTextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetKeyNameTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetKeyNameTextW@12     ; place to save the pointer
                    push dword [_Unicows_GetKeyNameTextW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetKeyNameTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetKeyNameTextW@12]

_GetKeyNameTextW@12:
                    jmp [__imp__GetKeyNameTextW@12]


                    section .data

__imp__GetKeyNameTextW@12:   dd unicows_initial_stub_GetKeyNameTextW
_Unicows_GetKeyNameTextW:      dd 0
namestring_GetKeyNameTextW:    db 'GetKeyNameTextW',0
