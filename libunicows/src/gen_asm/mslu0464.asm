%include "dll_names.inc"

                    global __imp__GetPrinterDataW@24
                    global _GetPrinterDataW@24
                    global _Unicows_GetPrinterDataW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetPrinterDataW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrinterDataW@24     ; place to save the pointer
                    push dword [_Unicows_GetPrinterDataW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_GetPrinterDataW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetPrinterDataW@24]

_GetPrinterDataW@24:
                    jmp [__imp__GetPrinterDataW@24]


                    section .data

__imp__GetPrinterDataW@24:   dd unicows_initial_stub_GetPrinterDataW
_Unicows_GetPrinterDataW:      dd 0
namestring_GetPrinterDataW:    db 'GetPrinterDataW',0
