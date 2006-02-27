%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetCurrencyFormatW@24
                    global GetCurrencyFormatW
                    global _GetCurrencyFormatW@24
                    global _Unicows_GetCurrencyFormatW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetCurrencyFormatW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCurrencyFormatW@24     ; place to save the pointer
                    push dword [_Unicows_GetCurrencyFormatW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetCurrencyFormatW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetCurrencyFormatW:
_GetCurrencyFormatW@24:
                    jmp [__imp__GetCurrencyFormatW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetCurrencyFormatW@24:   dd unicows_initial_stub_GetCurrencyFormatW
_Unicows_GetCurrencyFormatW:      dd 0
namestring_GetCurrencyFormatW:    db 'GetCurrencyFormatW',0
