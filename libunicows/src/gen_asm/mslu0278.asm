%include "dll_names.inc"

                    global __imp__RegSetValueW@20
                    global _RegSetValueW@20
                    global _Unicows_RegSetValueW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegSetValueW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegSetValueW@20     ; place to save the pointer
                    push dword [_Unicows_RegSetValueW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegSetValueW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegSetValueW@20]

_RegSetValueW@20:
                    jmp [__imp__RegSetValueW@20]


                    section .data

__imp__RegSetValueW@20:   dd unicows_initial_stub_RegSetValueW
_Unicows_RegSetValueW:      dd 0
namestring_RegSetValueW:    db 'RegSetValueW',0
