%include "dll_names.inc"

                    global __imp__VerLanguageNameW@12
                    global _VerLanguageNameW@12
                    global _Unicows_VerLanguageNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_VerLanguageNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__VerLanguageNameW@12     ; place to save the pointer
                    push dword [_Unicows_VerLanguageNameW]      ; default proc, if any
                    push dword VERSION                  ; dll id
                    push dword namestring_VerLanguageNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__VerLanguageNameW@12]

_VerLanguageNameW@12:
                    jmp [__imp__VerLanguageNameW@12]


                    section .data

__imp__VerLanguageNameW@12:   dd unicows_initial_stub_VerLanguageNameW
_Unicows_VerLanguageNameW:      dd 0
namestring_VerLanguageNameW:    db 'VerLanguageNameW',0
