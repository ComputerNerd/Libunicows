%include "dll_names.inc"

                    global __imp__joyGetDevCapsW@12
                    global _joyGetDevCapsW@12
                    global _Unicows_joyGetDevCapsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_joyGetDevCapsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__joyGetDevCapsW@12     ; place to save the pointer
                    push dword [_Unicows_joyGetDevCapsW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_joyGetDevCapsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__joyGetDevCapsW@12]

_joyGetDevCapsW@12:
                    jmp [__imp__joyGetDevCapsW@12]


                    section .data

__imp__joyGetDevCapsW@12:   dd unicows_initial_stub_joyGetDevCapsW
_Unicows_joyGetDevCapsW:      dd 0
namestring_joyGetDevCapsW:    db 'joyGetDevCapsW',0
