%include "dll_names.inc"

                    global __imp__EnumPrinterDriversW@28
                    global _EnumPrinterDriversW@28
                    global _Unicows_EnumPrinterDriversW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumPrinterDriversW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPrinterDriversW@28     ; place to save the pointer
                    push dword [_Unicows_EnumPrinterDriversW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_EnumPrinterDriversW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumPrinterDriversW@28]

_EnumPrinterDriversW@28:
                    jmp [__imp__EnumPrinterDriversW@28]


                    section .data

__imp__EnumPrinterDriversW@28:   dd unicows_initial_stub_EnumPrinterDriversW
_Unicows_EnumPrinterDriversW:      dd 0
namestring_EnumPrinterDriversW:    db 'EnumPrinterDriversW',0
