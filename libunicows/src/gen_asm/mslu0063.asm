%include "dll_names.inc"

                    global __imp__auxGetDevCapsW@12
                    global _auxGetDevCapsW@12
                    global _Unicows_auxGetDevCapsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_auxGetDevCapsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__auxGetDevCapsW@12     ; place to save the pointer
                    push dword [_Unicows_auxGetDevCapsW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_auxGetDevCapsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__auxGetDevCapsW@12]

_auxGetDevCapsW@12:
                    jmp [__imp__auxGetDevCapsW@12]


                    section .data

__imp__auxGetDevCapsW@12:   dd unicows_initial_stub_auxGetDevCapsW
_Unicows_auxGetDevCapsW:      dd 0
namestring_auxGetDevCapsW:    db 'auxGetDevCapsW',0
