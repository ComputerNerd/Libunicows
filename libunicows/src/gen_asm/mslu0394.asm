%include "dll_names.inc"

                    global __imp__SearchPathW@24
                    global _SearchPathW@24
                    global _Unicows_SearchPathW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SearchPathW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SearchPathW@24     ; place to save the pointer
                    push dword [_Unicows_SearchPathW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SearchPathW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SearchPathW@24]

_SearchPathW@24:
                    jmp [__imp__SearchPathW@24]


                    section .data

__imp__SearchPathW@24:   dd unicows_initial_stub_SearchPathW
_Unicows_SearchPathW:      dd 0
namestring_SearchPathW:    db 'SearchPathW',0
