%include "dll_names.inc"

                    global __imp__RegOpenKeyExW@20
                    global _RegOpenKeyExW@20
                    global _Unicows_RegOpenKeyExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegOpenKeyExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegOpenKeyExW@20     ; place to save the pointer
                    push dword [_Unicows_RegOpenKeyExW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegOpenKeyExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegOpenKeyExW@20]

_RegOpenKeyExW@20:
                    jmp [__imp__RegOpenKeyExW@20]


                    section .data

__imp__RegOpenKeyExW@20:   dd unicows_initial_stub_RegOpenKeyExW
_Unicows_RegOpenKeyExW:      dd 0
namestring_RegOpenKeyExW:    db 'RegOpenKeyExW',0
