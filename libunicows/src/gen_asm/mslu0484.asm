%include "dll_names.inc"

                    global __imp__capGetDriverDescriptionW@20
                    global _capGetDriverDescriptionW@20
                    global _Unicows_capGetDriverDescriptionW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_capGetDriverDescriptionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__capGetDriverDescriptionW@20     ; place to save the pointer
                    push dword [_Unicows_capGetDriverDescriptionW]      ; default proc, if any
                    push dword AVICAP32                  ; dll id
                    push dword namestring_capGetDriverDescriptionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__capGetDriverDescriptionW@20]

_capGetDriverDescriptionW@20:
                    jmp [__imp__capGetDriverDescriptionW@20]


                    section .data

__imp__capGetDriverDescriptionW@20:   dd unicows_initial_stub_capGetDriverDescriptionW
_Unicows_capGetDriverDescriptionW:      dd 0
namestring_capGetDriverDescriptionW:    db 'capGetDriverDescriptionW',0
