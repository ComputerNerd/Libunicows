%include "dll_names.inc"

                    global __imp__DrawTextW@20
                    global _DrawTextW@20
                    global _Unicows_DrawTextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DrawTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DrawTextW@20     ; place to save the pointer
                    push dword [_Unicows_DrawTextW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DrawTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DrawTextW@20]

_DrawTextW@20:
                    jmp [__imp__DrawTextW@20]


                    section .data

__imp__DrawTextW@20:   dd unicows_initial_stub_DrawTextW
_Unicows_DrawTextW:      dd 0
namestring_DrawTextW:    db 'DrawTextW',0
