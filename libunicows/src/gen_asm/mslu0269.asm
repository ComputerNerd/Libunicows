%include "dll_names.inc"

                    global __imp__RegQueryMultipleValuesW@20
                    global _RegQueryMultipleValuesW@20
                    global _Unicows_RegQueryMultipleValuesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegQueryMultipleValuesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegQueryMultipleValuesW@20     ; place to save the pointer
                    push dword [_Unicows_RegQueryMultipleValuesW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegQueryMultipleValuesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegQueryMultipleValuesW@20]

_RegQueryMultipleValuesW@20:
                    jmp [__imp__RegQueryMultipleValuesW@20]


                    section .data

__imp__RegQueryMultipleValuesW@20:   dd unicows_initial_stub_RegQueryMultipleValuesW
_Unicows_RegQueryMultipleValuesW:      dd 0
namestring_RegQueryMultipleValuesW:    db 'RegQueryMultipleValuesW',0
