%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__SetPrinterW@16
                    global SetPrinterW
                    global _SetPrinterW@16
                    global _Unicows_SetPrinterW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetPrinterW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetPrinterW@16     ; place to save the pointer
                    push dword [_Unicows_SetPrinterW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_SetPrinterW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetPrinterW:
_SetPrinterW@16:
                    jmp [__imp__SetPrinterW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetPrinterW@16:   dd unicows_initial_stub_SetPrinterW
_Unicows_SetPrinterW:      dd 0
namestring_SetPrinterW:    db 'SetPrinterW',0
