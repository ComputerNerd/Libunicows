%include "dll_names.inc"

                    global __imp__GetNumberFormatW@24
                    global GetNumberFormatW
                    global _GetNumberFormatW@24
                    global _Unicows_GetNumberFormatW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetNumberFormatW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetNumberFormatW@24     ; place to save the pointer
                    push dword [_Unicows_GetNumberFormatW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetNumberFormatW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetNumberFormatW:
_GetNumberFormatW@24:
                    jmp [__imp__GetNumberFormatW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetNumberFormatW@24:   dd unicows_initial_stub_GetNumberFormatW
_Unicows_GetNumberFormatW:      dd 0
namestring_GetNumberFormatW:    db 'GetNumberFormatW',0
