%include "dll_names.inc"

                    global __imp__OemToCharW@8
                    global _OemToCharW@8
                    global _Unicows_OemToCharW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OemToCharW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OemToCharW@8     ; place to save the pointer
                    push dword [_Unicows_OemToCharW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_OemToCharW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OemToCharW@8]

_OemToCharW@8:
                    jmp [__imp__OemToCharW@8]


                    section .data

__imp__OemToCharW@8:   dd unicows_initial_stub_OemToCharW
_Unicows_OemToCharW:      dd 0
namestring_OemToCharW:    db 'OemToCharW',0
