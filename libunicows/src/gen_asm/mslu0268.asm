%include "dll_names.inc"

                    global __imp__RegQueryInfoKeyW@48
                    global _RegQueryInfoKeyW@48
                    global _Unicows_RegQueryInfoKeyW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegQueryInfoKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegQueryInfoKeyW@48     ; place to save the pointer
                    push dword [_Unicows_RegQueryInfoKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegQueryInfoKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegQueryInfoKeyW@48]

_RegQueryInfoKeyW@48:
                    jmp [__imp__RegQueryInfoKeyW@48]


                    section .data

__imp__RegQueryInfoKeyW@48:   dd unicows_initial_stub_RegQueryInfoKeyW
_Unicows_RegQueryInfoKeyW:      dd 0
namestring_RegQueryInfoKeyW:    db 'RegQueryInfoKeyW',0
