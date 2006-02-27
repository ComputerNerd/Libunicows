%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetPrinterW@20
                    global GetPrinterW
                    global _GetPrinterW@20
                    global _Unicows_GetPrinterW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetPrinterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrinterW@20     ; place to save the pointer
                    push dword [_Unicows_GetPrinterW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_GetPrinterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetPrinterW:
_GetPrinterW@20:
                    jmp [__imp__GetPrinterW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetPrinterW@20:   dd unicows_initial_stub_GetPrinterW
_Unicows_GetPrinterW:      dd 0
namestring_GetPrinterW:    db 'GetPrinterW',0