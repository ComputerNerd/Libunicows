%include "dll_names.inc"

                    global __imp__StartDocPrinterW@12
                    global _StartDocPrinterW@12
                    global _Unicows_StartDocPrinterW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_StartDocPrinterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__StartDocPrinterW@12     ; place to save the pointer
                    push dword [_Unicows_StartDocPrinterW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_StartDocPrinterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__StartDocPrinterW@12]

_StartDocPrinterW@12:
                    jmp [__imp__StartDocPrinterW@12]


                    section .data

__imp__StartDocPrinterW@12:   dd unicows_initial_stub_StartDocPrinterW
_Unicows_StartDocPrinterW:      dd 0
namestring_StartDocPrinterW:    db 'StartDocPrinterW',0
