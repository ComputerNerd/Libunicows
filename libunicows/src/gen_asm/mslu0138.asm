%include "dll_names.inc"

                    global __imp__DrawTextExW@24
                    global _DrawTextExW@24
                    global _Unicows_DrawTextExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DrawTextExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DrawTextExW@24     ; place to save the pointer
                    push dword [_Unicows_DrawTextExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DrawTextExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DrawTextExW@24]

_DrawTextExW@24:
                    jmp [__imp__DrawTextExW@24]


                    section .data

__imp__DrawTextExW@24:   dd unicows_initial_stub_DrawTextExW
_Unicows_DrawTextExW:      dd 0
namestring_DrawTextExW:    db 'DrawTextExW',0
