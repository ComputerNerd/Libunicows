%include "dll_names.inc"

                    global __imp__DeletePortW@12
                    global _DeletePortW@12
                    global _Unicows_DeletePortW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DeletePortW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DeletePortW@12     ; place to save the pointer
                    push dword [_Unicows_DeletePortW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_DeletePortW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DeletePortW@12]

_DeletePortW@12:
                    jmp [__imp__DeletePortW@12]


                    section .data

__imp__DeletePortW@12:   dd unicows_initial_stub_DeletePortW
_Unicows_DeletePortW:      dd 0
namestring_DeletePortW:    db 'DeletePortW',0
