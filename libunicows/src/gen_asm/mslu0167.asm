%include "dll_names.inc"

                    global __imp__GetWindowLongA@8
                    global _GetWindowLongA@8
                    global _Unicows_GetWindowLongA
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetWindowLongA:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetWindowLongA@8     ; place to save the pointer
                    push dword [_Unicows_GetWindowLongA]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetWindowLongA      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetWindowLongA@8]

_GetWindowLongA@8:
                    jmp [__imp__GetWindowLongA@8]


                    section .data

__imp__GetWindowLongA@8:   dd unicows_initial_stub_GetWindowLongA
_Unicows_GetWindowLongA:      dd 0
namestring_GetWindowLongA:    db 'GetWindowLongA',0
