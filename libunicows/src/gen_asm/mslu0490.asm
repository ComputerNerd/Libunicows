%include "dll_names.inc"

                    global __imp__QueryContextAttributesW@12
                    global _QueryContextAttributesW@12
                    global _Unicows_QueryContextAttributesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_QueryContextAttributesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__QueryContextAttributesW@12     ; place to save the pointer
                    push dword [_Unicows_QueryContextAttributesW]      ; default proc, if any
                    push dword SECUR32                  ; dll id
                    push dword namestring_QueryContextAttributesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__QueryContextAttributesW@12]

_QueryContextAttributesW@12:
                    jmp [__imp__QueryContextAttributesW@12]


                    section .data

__imp__QueryContextAttributesW@12:   dd unicows_initial_stub_QueryContextAttributesW
_Unicows_QueryContextAttributesW:      dd 0
namestring_QueryContextAttributesW:    db 'QueryContextAttributesW',0
