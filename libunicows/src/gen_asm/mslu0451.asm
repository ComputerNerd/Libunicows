%include "dll_names.inc"

                    global __imp__AddPrinterW@12
                    global _AddPrinterW@12
                    global _Unicows_AddPrinterW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_AddPrinterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AddPrinterW@12     ; place to save the pointer
                    push dword [_Unicows_AddPrinterW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_AddPrinterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__AddPrinterW@12]

_AddPrinterW@12:
                    jmp [__imp__AddPrinterW@12]


                    section .data

__imp__AddPrinterW@12:   dd unicows_initial_stub_AddPrinterW
_Unicows_AddPrinterW:      dd 0
namestring_AddPrinterW:    db 'AddPrinterW',0
