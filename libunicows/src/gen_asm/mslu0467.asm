%include "dll_names.inc"

                    global __imp__GetPrinterW@20
                    global _GetPrinterW@20
                    global _Unicows_GetPrinterW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetPrinterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrinterW@20     ; place to save the pointer
                    push dword [_Unicows_GetPrinterW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_GetPrinterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetPrinterW@20]

_GetPrinterW@20:
                    jmp [__imp__GetPrinterW@20]


                    section .data

__imp__GetPrinterW@20:   dd unicows_initial_stub_GetPrinterW
_Unicows_GetPrinterW:      dd 0
namestring_GetPrinterW:    db 'GetPrinterW',0
