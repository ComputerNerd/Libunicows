%include "dll_names.inc"

                    global __imp__RegCreateKeyW@12
                    global _RegCreateKeyW@12
                    global _Unicows_RegCreateKeyW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegCreateKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegCreateKeyW@12     ; place to save the pointer
                    push dword [_Unicows_RegCreateKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegCreateKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegCreateKeyW@12]

_RegCreateKeyW@12:
                    jmp [__imp__RegCreateKeyW@12]


                    section .data

__imp__RegCreateKeyW@12:   dd unicows_initial_stub_RegCreateKeyW
_Unicows_RegCreateKeyW:      dd 0
namestring_RegCreateKeyW:    db 'RegCreateKeyW',0
