%include "dll_names.inc"

                    global __imp__RegCreateKeyExW@36
                    global _RegCreateKeyExW@36
                    global _Unicows_RegCreateKeyExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegCreateKeyExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegCreateKeyExW@36     ; place to save the pointer
                    push dword [_Unicows_RegCreateKeyExW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegCreateKeyExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegCreateKeyExW@36]

_RegCreateKeyExW@36:
                    jmp [__imp__RegCreateKeyExW@36]


                    section .data

__imp__RegCreateKeyExW@36:   dd unicows_initial_stub_RegCreateKeyExW
_Unicows_RegCreateKeyExW:      dd 0
namestring_RegCreateKeyExW:    db 'RegCreateKeyExW',0
