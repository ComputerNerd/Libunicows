%include "dll_names.inc"

                    global __imp__LoadIconW@8
                    global _LoadIconW@8
                    global _Unicows_LoadIconW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_LoadIconW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadIconW@8     ; place to save the pointer
                    push dword [_Unicows_LoadIconW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadIconW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__LoadIconW@8]

_LoadIconW@8:
                    jmp [__imp__LoadIconW@8]


                    section .data

__imp__LoadIconW@8:   dd unicows_initial_stub_LoadIconW
_Unicows_LoadIconW:      dd 0
namestring_LoadIconW:    db 'LoadIconW',0
