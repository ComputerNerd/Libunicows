%include "dll_names.inc"

                    global __imp__ResetPrinterW@8
                    global _ResetPrinterW@8
                    global _Unicows_ResetPrinterW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ResetPrinterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ResetPrinterW@8     ; place to save the pointer
                    push dword [_Unicows_ResetPrinterW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_ResetPrinterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ResetPrinterW@8]

_ResetPrinterW@8:
                    jmp [__imp__ResetPrinterW@8]


                    section .data

__imp__ResetPrinterW@8:   dd unicows_initial_stub_ResetPrinterW
_Unicows_ResetPrinterW:      dd 0
namestring_ResetPrinterW:    db 'ResetPrinterW',0
