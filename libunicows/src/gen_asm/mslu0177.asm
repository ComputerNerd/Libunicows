%include "dll_names.inc"

                    global __imp__InsertMenuW@20
                    global _InsertMenuW@20
                    global _Unicows_InsertMenuW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_InsertMenuW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__InsertMenuW@20     ; place to save the pointer
                    push dword [_Unicows_InsertMenuW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_InsertMenuW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__InsertMenuW@20]

_InsertMenuW@20:
                    jmp [__imp__InsertMenuW@20]


                    section .data

__imp__InsertMenuW@20:   dd unicows_initial_stub_InsertMenuW
_Unicows_InsertMenuW:      dd 0
namestring_InsertMenuW:    db 'InsertMenuW',0
