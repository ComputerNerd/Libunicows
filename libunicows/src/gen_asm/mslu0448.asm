%include "dll_names.inc"

                    global __imp__AddPrintProcessorW@16
                    global _AddPrintProcessorW@16
                    global _Unicows_AddPrintProcessorW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_AddPrintProcessorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AddPrintProcessorW@16     ; place to save the pointer
                    push dword [_Unicows_AddPrintProcessorW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_AddPrintProcessorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__AddPrintProcessorW@16]

_AddPrintProcessorW@16:
                    jmp [__imp__AddPrintProcessorW@16]


                    section .data

__imp__AddPrintProcessorW@16:   dd unicows_initial_stub_AddPrintProcessorW
_Unicows_AddPrintProcessorW:      dd 0
namestring_AddPrintProcessorW:    db 'AddPrintProcessorW',0
