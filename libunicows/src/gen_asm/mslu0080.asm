%include "dll_names.inc"

                    global __imp__mmioStringToFOURCCW@8
                    global _mmioStringToFOURCCW@8
                    global _Unicows_mmioStringToFOURCCW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_mmioStringToFOURCCW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mmioStringToFOURCCW@8     ; place to save the pointer
                    push dword [_Unicows_mmioStringToFOURCCW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mmioStringToFOURCCW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__mmioStringToFOURCCW@8]

_mmioStringToFOURCCW@8:
                    jmp [__imp__mmioStringToFOURCCW@8]


                    section .data

__imp__mmioStringToFOURCCW@8:   dd unicows_initial_stub_mmioStringToFOURCCW
_Unicows_mmioStringToFOURCCW:      dd 0
namestring_mmioStringToFOURCCW:    db 'mmioStringToFOURCCW',0
