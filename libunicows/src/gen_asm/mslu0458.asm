%include "dll_names.inc"

                    global __imp__DeletePrinterDriverW@12
                    global DeletePrinterDriverW
                    global _DeletePrinterDriverW@12
                    global _Unicows_DeletePrinterDriverW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DeletePrinterDriverW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DeletePrinterDriverW@12     ; place to save the pointer
                    push dword [_Unicows_DeletePrinterDriverW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_DeletePrinterDriverW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DeletePrinterDriverW:
_DeletePrinterDriverW@12:
                    jmp [__imp__DeletePrinterDriverW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DeletePrinterDriverW@12:   dd unicows_initial_stub_DeletePrinterDriverW
_Unicows_DeletePrinterDriverW:      dd 0
namestring_DeletePrinterDriverW:    db 'DeletePrinterDriverW',0
