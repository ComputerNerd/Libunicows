%include "dll_names.inc"

                    global __imp__GetMenuItemInfoW@16
                    global _GetMenuItemInfoW@16
                    global _Unicows_GetMenuItemInfoW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetMenuItemInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetMenuItemInfoW@16     ; place to save the pointer
                    push dword [_Unicows_GetMenuItemInfoW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetMenuItemInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetMenuItemInfoW@16]

_GetMenuItemInfoW@16:
                    jmp [__imp__GetMenuItemInfoW@16]


                    section .data

__imp__GetMenuItemInfoW@16:   dd unicows_initial_stub_GetMenuItemInfoW
_Unicows_GetMenuItemInfoW:      dd 0
namestring_GetMenuItemInfoW:    db 'GetMenuItemInfoW',0
