%include "dll_names.inc"

                    global __imp__GetPrinterDriverDirectoryW@24
                    global _GetPrinterDriverDirectoryW@24
                    global _Unicows_GetPrinterDriverDirectoryW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetPrinterDriverDirectoryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrinterDriverDirectoryW@24     ; place to save the pointer
                    push dword [_Unicows_GetPrinterDriverDirectoryW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_GetPrinterDriverDirectoryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetPrinterDriverDirectoryW@24]

_GetPrinterDriverDirectoryW@24:
                    jmp [__imp__GetPrinterDriverDirectoryW@24]


                    section .data

__imp__GetPrinterDriverDirectoryW@24:   dd unicows_initial_stub_GetPrinterDriverDirectoryW
_Unicows_GetPrinterDriverDirectoryW:      dd 0
namestring_GetPrinterDriverDirectoryW:    db 'GetPrinterDriverDirectoryW',0
