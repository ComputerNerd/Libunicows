%include "dll_names.inc"

                    global __imp__CharToOemW@8
                    global _CharToOemW@8
                    global _Unicows_CharToOemW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CharToOemW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CharToOemW@8     ; place to save the pointer
                    push dword [_Unicows_CharToOemW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CharToOemW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CharToOemW@8]

_CharToOemW@8:
                    jmp [__imp__CharToOemW@8]


                    section .data

__imp__CharToOemW@8:   dd unicows_initial_stub_CharToOemW
_Unicows_CharToOemW:      dd 0
namestring_CharToOemW:    db 'CharToOemW',0
