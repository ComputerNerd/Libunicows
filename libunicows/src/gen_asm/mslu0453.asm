%include "dll_names.inc"

                    global __imp__ConfigurePortW@12
                    global ConfigurePortW
                    global _ConfigurePortW@12
                    global _Unicows_ConfigurePortW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ConfigurePortW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ConfigurePortW@12     ; place to save the pointer
                    push dword [_Unicows_ConfigurePortW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_ConfigurePortW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ConfigurePortW:
_ConfigurePortW@12:
                    jmp [__imp__ConfigurePortW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ConfigurePortW@12:   dd unicows_initial_stub_ConfigurePortW
_Unicows_ConfigurePortW:      dd 0
namestring_ConfigurePortW:    db 'ConfigurePortW',0
