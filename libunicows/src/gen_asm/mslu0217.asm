%include "dll_names.inc"

                    global __imp__SetMenuItemInfoW@16
                    global _SetMenuItemInfoW@16
                    global _Unicows_SetMenuItemInfoW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetMenuItemInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetMenuItemInfoW@16     ; place to save the pointer
                    push dword [_Unicows_SetMenuItemInfoW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetMenuItemInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetMenuItemInfoW@16]

_SetMenuItemInfoW@16:
                    jmp [__imp__SetMenuItemInfoW@16]


                    section .data

__imp__SetMenuItemInfoW@16:   dd unicows_initial_stub_SetMenuItemInfoW
_Unicows_SetMenuItemInfoW:      dd 0
namestring_SetMenuItemInfoW:    db 'SetMenuItemInfoW',0
