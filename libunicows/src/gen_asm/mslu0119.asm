%include "dll_names.inc"

                    global __imp__CreateWindowExW@48
                    global _CreateWindowExW@48
                    global _Unicows_CreateWindowExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateWindowExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateWindowExW@48     ; place to save the pointer
                    push dword [_Unicows_CreateWindowExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CreateWindowExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateWindowExW@48]

_CreateWindowExW@48:
                    jmp [__imp__CreateWindowExW@48]


                    section .data

__imp__CreateWindowExW@48:   dd unicows_initial_stub_CreateWindowExW
_Unicows_CreateWindowExW:      dd 0
namestring_CreateWindowExW:    db 'CreateWindowExW',0
