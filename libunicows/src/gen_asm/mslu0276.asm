%include "dll_names.inc"

                    global __imp__RegSaveKeyW@12
                    global _RegSaveKeyW@12
                    global _Unicows_RegSaveKeyW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegSaveKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegSaveKeyW@12     ; place to save the pointer
                    push dword [_Unicows_RegSaveKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegSaveKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegSaveKeyW@12]

_RegSaveKeyW@12:
                    jmp [__imp__RegSaveKeyW@12]


                    section .data

__imp__RegSaveKeyW@12:   dd unicows_initial_stub_RegSaveKeyW
_Unicows_RegSaveKeyW:      dd 0
namestring_RegSaveKeyW:    db 'RegSaveKeyW',0
