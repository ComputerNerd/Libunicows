%include "dll_names.inc"

                    global __imp__SetPrinterDataW@20
                    global _SetPrinterDataW@20
                    global _Unicows_SetPrinterDataW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetPrinterDataW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetPrinterDataW@20     ; place to save the pointer
                    push dword [_Unicows_SetPrinterDataW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_SetPrinterDataW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetPrinterDataW@20]

_SetPrinterDataW@20:
                    jmp [__imp__SetPrinterDataW@20]


                    section .data

__imp__SetPrinterDataW@20:   dd unicows_initial_stub_SetPrinterDataW
_Unicows_SetPrinterDataW:      dd 0
namestring_SetPrinterDataW:    db 'SetPrinterDataW',0