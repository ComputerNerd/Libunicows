%include "dll_names.inc"

                    global __imp__PlaySoundW@12
                    global _PlaySoundW@12
                    global _Unicows_PlaySoundW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_PlaySoundW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__PlaySoundW@12     ; place to save the pointer
                    push dword [_Unicows_PlaySoundW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_PlaySoundW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__PlaySoundW@12]

_PlaySoundW@12:
                    jmp [__imp__PlaySoundW@12]


                    section .data

__imp__PlaySoundW@12:   dd unicows_initial_stub_PlaySoundW
_Unicows_PlaySoundW:      dd 0
namestring_PlaySoundW:    db 'PlaySoundW',0
