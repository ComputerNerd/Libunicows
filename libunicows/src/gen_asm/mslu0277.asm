%include "dll_names.inc"

                    global __imp__RegSetValueExW@24
                    global _RegSetValueExW@24
                    global _Unicows_RegSetValueExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegSetValueExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegSetValueExW@24     ; place to save the pointer
                    push dword [_Unicows_RegSetValueExW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegSetValueExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegSetValueExW@24]

_RegSetValueExW@24:
                    jmp [__imp__RegSetValueExW@24]


                    section .data

__imp__RegSetValueExW@24:   dd unicows_initial_stub_RegSetValueExW
_Unicows_RegSetValueExW:      dd 0
namestring_RegSetValueExW:    db 'RegSetValueExW',0
