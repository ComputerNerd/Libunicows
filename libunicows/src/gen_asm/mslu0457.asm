%include "dll_names.inc"

                    global __imp__DeletePrintProvidorW@12
                    global _DeletePrintProvidorW@12
                    global _Unicows_DeletePrintProvidorW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DeletePrintProvidorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DeletePrintProvidorW@12     ; place to save the pointer
                    push dword [_Unicows_DeletePrintProvidorW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_DeletePrintProvidorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DeletePrintProvidorW@12]

_DeletePrintProvidorW@12:
                    jmp [__imp__DeletePrintProvidorW@12]


                    section .data

__imp__DeletePrintProvidorW@12:   dd unicows_initial_stub_DeletePrintProvidorW
_Unicows_DeletePrintProvidorW:      dd 0
namestring_DeletePrintProvidorW:    db 'DeletePrintProvidorW',0
