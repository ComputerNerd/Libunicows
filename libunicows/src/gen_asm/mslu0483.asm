%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetPrinterDataW@24
                    global GetPrinterDataW
                    global _GetPrinterDataW@24
                    global _Unicows_GetPrinterDataW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetPrinterDataW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrinterDataW@24     ; place to save the pointer
                    push dword [_Unicows_GetPrinterDataW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_GetPrinterDataW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetPrinterDataW:
_GetPrinterDataW@24:
                    jmp [__imp__GetPrinterDataW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetPrinterDataW@24:   dd unicows_initial_stub_GetPrinterDataW
_Unicows_GetPrinterDataW:      dd 0
namestring_GetPrinterDataW:    db 'GetPrinterDataW',0
