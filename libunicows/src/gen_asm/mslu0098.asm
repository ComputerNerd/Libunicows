%include "dll_names.inc"

                    global __imp__AppendMenuW@16
                    global _AppendMenuW@16
                    global _Unicows_AppendMenuW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_AppendMenuW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AppendMenuW@16     ; place to save the pointer
                    push dword [_Unicows_AppendMenuW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_AppendMenuW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__AppendMenuW@16]

_AppendMenuW@16:
                    jmp [__imp__AppendMenuW@16]


                    section .data

__imp__AppendMenuW@16:   dd unicows_initial_stub_AppendMenuW
_Unicows_AppendMenuW:      dd 0
namestring_AppendMenuW:    db 'AppendMenuW',0
