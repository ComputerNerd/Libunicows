%include "dll_names.inc"

                    global __imp__ExtractIconW@12
                    global _ExtractIconW@12
                    global _Unicows_ExtractIconW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ExtractIconW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ExtractIconW@12     ; place to save the pointer
                    push dword [_Unicows_ExtractIconW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_ExtractIconW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ExtractIconW@12]

_ExtractIconW@12:
                    jmp [__imp__ExtractIconW@12]


                    section .data

__imp__ExtractIconW@12:   dd unicows_initial_stub_ExtractIconW
_Unicows_ExtractIconW:      dd 0
namestring_ExtractIconW:    db 'ExtractIconW',0
