%include "dll_names.inc"

                    global __imp__RegEnumKeyW@16
                    global _RegEnumKeyW@16
                    global _Unicows_RegEnumKeyW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegEnumKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegEnumKeyW@16     ; place to save the pointer
                    push dword [_Unicows_RegEnumKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegEnumKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegEnumKeyW@16]

_RegEnumKeyW@16:
                    jmp [__imp__RegEnumKeyW@16]


                    section .data

__imp__RegEnumKeyW@16:   dd unicows_initial_stub_RegEnumKeyW
_Unicows_RegEnumKeyW:      dd 0
namestring_RegEnumKeyW:    db 'RegEnumKeyW',0
