%include "dll_names.inc"

                    global __imp__mciGetErrorStringW@12
                    global _mciGetErrorStringW@12
                    global _Unicows_mciGetErrorStringW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_mciGetErrorStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mciGetErrorStringW@12     ; place to save the pointer
                    push dword [_Unicows_mciGetErrorStringW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mciGetErrorStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__mciGetErrorStringW@12]

_mciGetErrorStringW@12:
                    jmp [__imp__mciGetErrorStringW@12]


                    section .data

__imp__mciGetErrorStringW@12:   dd unicows_initial_stub_mciGetErrorStringW
_Unicows_mciGetErrorStringW:      dd 0
namestring_mciGetErrorStringW:    db 'mciGetErrorStringW',0
