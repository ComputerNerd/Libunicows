%include "dll_names.inc"

                    global __imp__GetPrinterDriverW@24
                    global _GetPrinterDriverW@24
                    global _Unicows_GetPrinterDriverW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetPrinterDriverW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrinterDriverW@24     ; place to save the pointer
                    push dword [_Unicows_GetPrinterDriverW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_GetPrinterDriverW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetPrinterDriverW@24]

_GetPrinterDriverW@24:
                    jmp [__imp__GetPrinterDriverW@24]


                    section .data

__imp__GetPrinterDriverW@24:   dd unicows_initial_stub_GetPrinterDriverW
_Unicows_GetPrinterDriverW:      dd 0
namestring_GetPrinterDriverW:    db 'GetPrinterDriverW',0
