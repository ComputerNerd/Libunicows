%include "dll_names.inc"

                    global __imp__RegOpenKeyW@12
                    global _RegOpenKeyW@12
                    global _Unicows_RegOpenKeyW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegOpenKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegOpenKeyW@12     ; place to save the pointer
                    push dword [_Unicows_RegOpenKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegOpenKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegOpenKeyW@12]

_RegOpenKeyW@12:
                    jmp [__imp__RegOpenKeyW@12]


                    section .data

__imp__RegOpenKeyW@12:   dd unicows_initial_stub_RegOpenKeyW
_Unicows_RegOpenKeyW:      dd 0
namestring_RegOpenKeyW:    db 'RegOpenKeyW',0
