%include "dll_names.inc"

                    global __imp__RegDeleteValueW@8
                    global _RegDeleteValueW@8
                    global _Unicows_RegDeleteValueW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegDeleteValueW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegDeleteValueW@8     ; place to save the pointer
                    push dword [_Unicows_RegDeleteValueW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegDeleteValueW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegDeleteValueW@8]

_RegDeleteValueW@8:
                    jmp [__imp__RegDeleteValueW@8]


                    section .data

__imp__RegDeleteValueW@8:   dd unicows_initial_stub_RegDeleteValueW
_Unicows_RegDeleteValueW:      dd 0
namestring_RegDeleteValueW:    db 'RegDeleteValueW',0
