%include "dll_names.inc"

                    global __imp__EnumPrintProcessorDatatypesW@28
                    global _EnumPrintProcessorDatatypesW@28
                    global _Unicows_EnumPrintProcessorDatatypesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumPrintProcessorDatatypesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPrintProcessorDatatypesW@28     ; place to save the pointer
                    push dword [_Unicows_EnumPrintProcessorDatatypesW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_EnumPrintProcessorDatatypesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumPrintProcessorDatatypesW@28]

_EnumPrintProcessorDatatypesW@28:
                    jmp [__imp__EnumPrintProcessorDatatypesW@28]


                    section .data

__imp__EnumPrintProcessorDatatypesW@28:   dd unicows_initial_stub_EnumPrintProcessorDatatypesW
_Unicows_EnumPrintProcessorDatatypesW:      dd 0
namestring_EnumPrintProcessorDatatypesW:    db 'EnumPrintProcessorDatatypesW',0
