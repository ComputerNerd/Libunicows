%include "dll_names.inc"

                    global __imp__LoadKeyboardLayoutW@8
                    global _LoadKeyboardLayoutW@8
                    global _Unicows_LoadKeyboardLayoutW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_LoadKeyboardLayoutW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadKeyboardLayoutW@8     ; place to save the pointer
                    push dword [_Unicows_LoadKeyboardLayoutW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadKeyboardLayoutW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__LoadKeyboardLayoutW@8]

_LoadKeyboardLayoutW@8:
                    jmp [__imp__LoadKeyboardLayoutW@8]


                    section .data

__imp__LoadKeyboardLayoutW@8:   dd unicows_initial_stub_LoadKeyboardLayoutW
_Unicows_LoadKeyboardLayoutW:      dd 0
namestring_LoadKeyboardLayoutW:    db 'LoadKeyboardLayoutW',0