%include "dll_names.inc"

                    global __imp__RegEnumValueW@32
                    global _RegEnumValueW@32
                    global _Unicows_RegEnumValueW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegEnumValueW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegEnumValueW@32     ; place to save the pointer
                    push dword [_Unicows_RegEnumValueW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegEnumValueW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegEnumValueW@32]

_RegEnumValueW@32:
                    jmp [__imp__RegEnumValueW@32]


                    section .data

__imp__RegEnumValueW@32:   dd unicows_initial_stub_RegEnumValueW
_Unicows_RegEnumValueW:      dd 0
namestring_RegEnumValueW:    db 'RegEnumValueW',0
