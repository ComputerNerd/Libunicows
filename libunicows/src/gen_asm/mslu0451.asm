%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__AddPrinterW@12
                    global AddPrinterW
                    global _AddPrinterW@12
                    global _Unicows_AddPrinterW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_AddPrinterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AddPrinterW@12     ; place to save the pointer
                    push dword [_Unicows_AddPrinterW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_AddPrinterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

AddPrinterW:
_AddPrinterW@12:
                    jmp [__imp__AddPrinterW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__AddPrinterW@12:   dd unicows_initial_stub_AddPrinterW
_Unicows_AddPrinterW:      dd 0
namestring_AddPrinterW:    db 'AddPrinterW',0
