%include "dll_names.inc"

                    global __imp__DeletePrintProcessorW@12
                    global _DeletePrintProcessorW@12
                    global _Unicows_DeletePrintProcessorW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DeletePrintProcessorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DeletePrintProcessorW@12     ; place to save the pointer
                    push dword [_Unicows_DeletePrintProcessorW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_DeletePrintProcessorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DeletePrintProcessorW@12]

_DeletePrintProcessorW@12:
                    jmp [__imp__DeletePrintProcessorW@12]


                    section .data

__imp__DeletePrintProcessorW@12:   dd unicows_initial_stub_DeletePrintProcessorW
_Unicows_DeletePrintProcessorW:      dd 0
namestring_DeletePrintProcessorW:    db 'DeletePrintProcessorW',0
