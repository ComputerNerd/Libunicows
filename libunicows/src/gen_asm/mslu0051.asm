%include "dll_names.inc"

                    global __imp__GetTextExtentPoint32W@16
                    global _GetTextExtentPoint32W@16
                    global _Unicows_GetTextExtentPoint32W
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetTextExtentPoint32W:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTextExtentPoint32W@16     ; place to save the pointer
                    push dword [_Unicows_GetTextExtentPoint32W]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetTextExtentPoint32W      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetTextExtentPoint32W@16]

_GetTextExtentPoint32W@16:
                    jmp [__imp__GetTextExtentPoint32W@16]


                    section .data

__imp__GetTextExtentPoint32W@16:   dd unicows_initial_stub_GetTextExtentPoint32W
_Unicows_GetTextExtentPoint32W:      dd 0
namestring_GetTextExtentPoint32W:    db 'GetTextExtentPoint32W',0
