%include "dll_names.inc"

                    global __imp__ExtractIconExW@20
                    global _ExtractIconExW@20
                    global _Unicows_ExtractIconExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ExtractIconExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ExtractIconExW@20     ; place to save the pointer
                    push dword [_Unicows_ExtractIconExW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_ExtractIconExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ExtractIconExW@20]

_ExtractIconExW@20:
                    jmp [__imp__ExtractIconExW@20]


                    section .data

__imp__ExtractIconExW@20:   dd unicows_initial_stub_ExtractIconExW
_Unicows_ExtractIconExW:      dd 0
namestring_ExtractIconExW:    db 'ExtractIconExW',0
