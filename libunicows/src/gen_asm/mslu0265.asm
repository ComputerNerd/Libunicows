%include "dll_names.inc"

                    global __imp__RegEnumKeyExW@32
                    global _RegEnumKeyExW@32
                    global _Unicows_RegEnumKeyExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegEnumKeyExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegEnumKeyExW@32     ; place to save the pointer
                    push dword [_Unicows_RegEnumKeyExW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegEnumKeyExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegEnumKeyExW@32]

_RegEnumKeyExW@32:
                    jmp [__imp__RegEnumKeyExW@32]


                    section .data

__imp__RegEnumKeyExW@32:   dd unicows_initial_stub_RegEnumKeyExW
_Unicows_RegEnumKeyExW:      dd 0
namestring_RegEnumKeyExW:    db 'RegEnumKeyExW',0
