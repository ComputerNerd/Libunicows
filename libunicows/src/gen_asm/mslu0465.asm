%include "dll_names.inc"

                    global __imp__EnumPrinterDriversW@28
                    global EnumPrinterDriversW
                    global _EnumPrinterDriversW@28
                    global _Unicows_EnumPrinterDriversW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumPrinterDriversW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPrinterDriversW@28     ; place to save the pointer
                    push dword [_Unicows_EnumPrinterDriversW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_EnumPrinterDriversW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumPrinterDriversW:
_EnumPrinterDriversW@28:
                    jmp [__imp__EnumPrinterDriversW@28]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumPrinterDriversW@28:   dd unicows_initial_stub_EnumPrinterDriversW
_Unicows_EnumPrinterDriversW:      dd 0
namestring_EnumPrinterDriversW:    db 'EnumPrinterDriversW',0
