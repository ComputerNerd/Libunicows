%include "dll_names.inc"

                    global __imp__DocumentPropertiesW@24
                    global _DocumentPropertiesW@24
                    global _Unicows_DocumentPropertiesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DocumentPropertiesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DocumentPropertiesW@24     ; place to save the pointer
                    push dword [_Unicows_DocumentPropertiesW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_DocumentPropertiesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DocumentPropertiesW@24]

_DocumentPropertiesW@24:
                    jmp [__imp__DocumentPropertiesW@24]


                    section .data

__imp__DocumentPropertiesW@24:   dd unicows_initial_stub_DocumentPropertiesW
_Unicows_DocumentPropertiesW:      dd 0
namestring_DocumentPropertiesW:    db 'DocumentPropertiesW',0