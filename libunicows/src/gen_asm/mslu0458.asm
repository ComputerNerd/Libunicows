%include "dll_names.inc"

                    global __imp__DeletePrinterDriverW@12
                    global _DeletePrinterDriverW@12
                    global _Unicows_DeletePrinterDriverW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DeletePrinterDriverW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DeletePrinterDriverW@12     ; place to save the pointer
                    push dword [_Unicows_DeletePrinterDriverW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_DeletePrinterDriverW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DeletePrinterDriverW@12]

_DeletePrinterDriverW@12:
                    jmp [__imp__DeletePrinterDriverW@12]


                    section .data

__imp__DeletePrinterDriverW@12:   dd unicows_initial_stub_DeletePrinterDriverW
_Unicows_DeletePrinterDriverW:      dd 0
namestring_DeletePrinterDriverW:    db 'DeletePrinterDriverW',0
