%include "dll_names.inc"

                    global __imp__SetICMProfileW@8
                    global _SetICMProfileW@8
                    global _Unicows_SetICMProfileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetICMProfileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetICMProfileW@8     ; place to save the pointer
                    push dword [_Unicows_SetICMProfileW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_SetICMProfileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetICMProfileW@8]

_SetICMProfileW@8:
                    jmp [__imp__SetICMProfileW@8]


                    section .data

__imp__SetICMProfileW@8:   dd unicows_initial_stub_SetICMProfileW
_Unicows_SetICMProfileW:      dd 0
namestring_SetICMProfileW:    db 'SetICMProfileW',0
