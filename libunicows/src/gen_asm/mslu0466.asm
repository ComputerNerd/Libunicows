%include "dll_names.inc"

                    global __imp__EnumPrintersW@28
                    global _EnumPrintersW@28
                    global _Unicows_EnumPrintersW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumPrintersW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPrintersW@28     ; place to save the pointer
                    push dword [_Unicows_EnumPrintersW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_EnumPrintersW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumPrintersW@28]

_EnumPrintersW@28:
                    jmp [__imp__EnumPrintersW@28]


                    section .data

__imp__EnumPrintersW@28:   dd unicows_initial_stub_EnumPrintersW
_Unicows_EnumPrintersW:      dd 0
namestring_EnumPrintersW:    db 'EnumPrintersW',0
