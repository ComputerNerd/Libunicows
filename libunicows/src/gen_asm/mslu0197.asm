%include "dll_names.inc"

                    global __imp__MessageBoxExW@20
                    global _MessageBoxExW@20
                    global _Unicows_MessageBoxExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_MessageBoxExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MessageBoxExW@20     ; place to save the pointer
                    push dword [_Unicows_MessageBoxExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_MessageBoxExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__MessageBoxExW@20]

_MessageBoxExW@20:
                    jmp [__imp__MessageBoxExW@20]


                    section .data

__imp__MessageBoxExW@20:   dd unicows_initial_stub_MessageBoxExW
_Unicows_MessageBoxExW:      dd 0
namestring_MessageBoxExW:    db 'MessageBoxExW',0
