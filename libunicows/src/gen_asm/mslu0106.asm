%include "dll_names.inc"

                    global __imp__CharLowerBuffW@8
                    global _CharLowerBuffW@8
                    global _Unicows_CharLowerBuffW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CharLowerBuffW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CharLowerBuffW@8     ; place to save the pointer
                    push dword [_Unicows_CharLowerBuffW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CharLowerBuffW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CharLowerBuffW@8]

_CharLowerBuffW@8:
                    jmp [__imp__CharLowerBuffW@8]


                    section .data

__imp__CharLowerBuffW@8:   dd unicows_initial_stub_CharLowerBuffW
_Unicows_CharLowerBuffW:      dd 0
namestring_CharLowerBuffW:    db 'CharLowerBuffW',0
