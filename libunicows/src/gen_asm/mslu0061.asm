%include "dll_names.inc"

                    global __imp__UpdateICMRegKeyW@16
                    global _UpdateICMRegKeyW@16
                    global _Unicows_UpdateICMRegKeyW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_UpdateICMRegKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__UpdateICMRegKeyW@16     ; place to save the pointer
                    push dword [_Unicows_UpdateICMRegKeyW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_UpdateICMRegKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__UpdateICMRegKeyW@16]

_UpdateICMRegKeyW@16:
                    jmp [__imp__UpdateICMRegKeyW@16]


                    section .data

__imp__UpdateICMRegKeyW@16:   dd unicows_initial_stub_UpdateICMRegKeyW
_Unicows_UpdateICMRegKeyW:      dd 0
namestring_UpdateICMRegKeyW:    db 'UpdateICMRegKeyW',0