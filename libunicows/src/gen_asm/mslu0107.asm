%include "dll_names.inc"

                    global __imp__CharLowerW@4
                    global _CharLowerW@4
                    global _Unicows_CharLowerW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CharLowerW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CharLowerW@4     ; place to save the pointer
                    push dword [_Unicows_CharLowerW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CharLowerW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CharLowerW@4]

_CharLowerW@4:
                    jmp [__imp__CharLowerW@4]


                    section .data

__imp__CharLowerW@4:   dd unicows_initial_stub_CharLowerW
_Unicows_CharLowerW:      dd 0
namestring_CharLowerW:    db 'CharLowerW',0
