%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__StartDocPrinterW@12
                    global StartDocPrinterW
                    global _StartDocPrinterW@12
                    global _Unicows_StartDocPrinterW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_StartDocPrinterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__StartDocPrinterW@12     ; place to save the pointer
                    push dword [_Unicows_StartDocPrinterW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_StartDocPrinterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

StartDocPrinterW:
_StartDocPrinterW@12:
                    jmp [__imp__StartDocPrinterW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__StartDocPrinterW@12:   dd unicows_initial_stub_StartDocPrinterW
_Unicows_StartDocPrinterW:      dd 0
namestring_StartDocPrinterW:    db 'StartDocPrinterW',0
