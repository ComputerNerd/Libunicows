%include "dll_names.inc"

                    global __imp__TextOutW@20
                    global _TextOutW@20
                    global _Unicows_TextOutW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_TextOutW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__TextOutW@20     ; place to save the pointer
                    push dword [_Unicows_TextOutW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_TextOutW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__TextOutW@20]

_TextOutW@20:
                    jmp [__imp__TextOutW@20]


                    section .data

__imp__TextOutW@20:   dd unicows_initial_stub_TextOutW
_Unicows_TextOutW:      dd 0
namestring_TextOutW:    db 'TextOutW',0
