%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetPrinterDriverW@24
                    global GetPrinterDriverW
                    global _GetPrinterDriverW@24
                    global _Unicows_GetPrinterDriverW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetPrinterDriverW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrinterDriverW@24     ; place to save the pointer
                    push dword [_Unicows_GetPrinterDriverW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_GetPrinterDriverW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetPrinterDriverW:
_GetPrinterDriverW@24:
                    jmp [__imp__GetPrinterDriverW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetPrinterDriverW@24:   dd unicows_initial_stub_GetPrinterDriverW
_Unicows_GetPrinterDriverW:      dd 0
namestring_GetPrinterDriverW:    db 'GetPrinterDriverW',0
