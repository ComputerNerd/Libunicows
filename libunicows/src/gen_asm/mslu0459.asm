%include "dll_names.inc"

                    global __imp__EnumPrintProcessorsW@28
                    global _EnumPrintProcessorsW@28
                    global _Unicows_EnumPrintProcessorsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumPrintProcessorsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPrintProcessorsW@28     ; place to save the pointer
                    push dword [_Unicows_EnumPrintProcessorsW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_EnumPrintProcessorsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumPrintProcessorsW@28]

_EnumPrintProcessorsW@28:
                    jmp [__imp__EnumPrintProcessorsW@28]


                    section .data

__imp__EnumPrintProcessorsW@28:   dd unicows_initial_stub_EnumPrintProcessorsW
_Unicows_EnumPrintProcessorsW:      dd 0
namestring_EnumPrintProcessorsW:    db 'EnumPrintProcessorsW',0
