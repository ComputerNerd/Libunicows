%include "dll_names.inc"

                    global __imp__RegQueryValueW@16
                    global _RegQueryValueW@16
                    global _Unicows_RegQueryValueW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegQueryValueW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegQueryValueW@16     ; place to save the pointer
                    push dword [_Unicows_RegQueryValueW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegQueryValueW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegQueryValueW@16]

_RegQueryValueW@16:
                    jmp [__imp__RegQueryValueW@16]


                    section .data

__imp__RegQueryValueW@16:   dd unicows_initial_stub_RegQueryValueW
_Unicows_RegQueryValueW:      dd 0
namestring_RegQueryValueW:    db 'RegQueryValueW',0
