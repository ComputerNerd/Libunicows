%include "dll_names.inc"

                    global __imp__AddPrintProvidorW@12
                    global _AddPrintProvidorW@12
                    global _Unicows_AddPrintProvidorW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_AddPrintProvidorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AddPrintProvidorW@12     ; place to save the pointer
                    push dword [_Unicows_AddPrintProvidorW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_AddPrintProvidorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__AddPrintProvidorW@12]

_AddPrintProvidorW@12:
                    jmp [__imp__AddPrintProvidorW@12]


                    section .data

__imp__AddPrintProvidorW@12:   dd unicows_initial_stub_AddPrintProvidorW
_Unicows_AddPrintProvidorW:      dd 0
namestring_AddPrintProvidorW:    db 'AddPrintProvidorW',0
