%include "dll_names.inc"

                    global __imp__mciSendCommandW@16
                    global _mciSendCommandW@16
                    global _Unicows_mciSendCommandW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_mciSendCommandW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mciSendCommandW@16     ; place to save the pointer
                    push dword [_Unicows_mciSendCommandW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mciSendCommandW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__mciSendCommandW@16]

_mciSendCommandW@16:
                    jmp [__imp__mciSendCommandW@16]


                    section .data

__imp__mciSendCommandW@16:   dd unicows_initial_stub_mciSendCommandW
_Unicows_mciSendCommandW:      dd 0
namestring_mciSendCommandW:    db 'mciSendCommandW',0
