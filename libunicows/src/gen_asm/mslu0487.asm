%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__OpenPrinterW@12
                    global OpenPrinterW
                    global _OpenPrinterW@12
                    global _Unicows_OpenPrinterW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OpenPrinterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OpenPrinterW@12     ; place to save the pointer
                    push dword [_Unicows_OpenPrinterW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_OpenPrinterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OpenPrinterW:
_OpenPrinterW@12:
                    jmp [__imp__OpenPrinterW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OpenPrinterW@12:   dd unicows_initial_stub_OpenPrinterW
_Unicows_OpenPrinterW:      dd 0
namestring_OpenPrinterW:    db 'OpenPrinterW',0
