%include "dll_names.inc"

                    global __imp__RegLoadKeyW@12
                    global _RegLoadKeyW@12
                    global _Unicows_RegLoadKeyW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegLoadKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegLoadKeyW@12     ; place to save the pointer
                    push dword [_Unicows_RegLoadKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegLoadKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegLoadKeyW@12]

_RegLoadKeyW@12:
                    jmp [__imp__RegLoadKeyW@12]


                    section .data

__imp__RegLoadKeyW@12:   dd unicows_initial_stub_RegLoadKeyW
_Unicows_RegLoadKeyW:      dd 0
namestring_RegLoadKeyW:    db 'RegLoadKeyW',0
