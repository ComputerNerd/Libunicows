%include "dll_names.inc"

                    global __imp__wvsprintfW@12
                    global _wvsprintfW@12
                    global _Unicows_wvsprintfW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_wvsprintfW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__wvsprintfW@12     ; place to save the pointer
                    push dword [_Unicows_wvsprintfW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_wvsprintfW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__wvsprintfW@12]

_wvsprintfW@12:
                    jmp [__imp__wvsprintfW@12]


                    section .data

__imp__wvsprintfW@12:   dd unicows_initial_stub_wvsprintfW
_Unicows_wvsprintfW:      dd 0
namestring_wvsprintfW:    db 'wvsprintfW',0
