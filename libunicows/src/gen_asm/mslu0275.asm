%include "dll_names.inc"

                    global __imp__RegReplaceKeyW@16
                    global _RegReplaceKeyW@16
                    global _Unicows_RegReplaceKeyW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegReplaceKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegReplaceKeyW@16     ; place to save the pointer
                    push dword [_Unicows_RegReplaceKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegReplaceKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegReplaceKeyW@16]

_RegReplaceKeyW@16:
                    jmp [__imp__RegReplaceKeyW@16]


                    section .data

__imp__RegReplaceKeyW@16:   dd unicows_initial_stub_RegReplaceKeyW
_Unicows_RegReplaceKeyW:      dd 0
namestring_RegReplaceKeyW:    db 'RegReplaceKeyW',0
