%include "dll_names.inc"

                    global __imp__SetPrinterW@16
                    global _SetPrinterW@16
                    global _Unicows_SetPrinterW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetPrinterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetPrinterW@16     ; place to save the pointer
                    push dword [_Unicows_SetPrinterW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_SetPrinterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetPrinterW@16]

_SetPrinterW@16:
                    jmp [__imp__SetPrinterW@16]


                    section .data

__imp__SetPrinterW@16:   dd unicows_initial_stub_SetPrinterW
_Unicows_SetPrinterW:      dd 0
namestring_SetPrinterW:    db 'SetPrinterW',0
