%include "dll_names.inc"

                    global __imp__AddPrinterDriverW@12
                    global AddPrinterDriverW
                    global _AddPrinterDriverW@12
                    global _Unicows_AddPrinterDriverW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_AddPrinterDriverW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AddPrinterDriverW@12     ; place to save the pointer
                    push dword [_Unicows_AddPrinterDriverW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_AddPrinterDriverW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

AddPrinterDriverW:
_AddPrinterDriverW@12:
                    jmp [__imp__AddPrinterDriverW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__AddPrinterDriverW@12:   dd unicows_initial_stub_AddPrinterDriverW
_Unicows_AddPrinterDriverW:      dd 0
namestring_AddPrinterDriverW:    db 'AddPrinterDriverW',0
