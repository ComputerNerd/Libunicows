%include "dll_names.inc"

                    global __imp__AddPortW@12
                    global AddPortW
                    global _AddPortW@12
                    global _Unicows_AddPortW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_AddPortW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AddPortW@12     ; place to save the pointer
                    push dword [_Unicows_AddPortW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_AddPortW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

AddPortW:
_AddPortW@12:
                    jmp [__imp__AddPortW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__AddPortW@12:   dd unicows_initial_stub_AddPortW
_Unicows_AddPortW:      dd 0
namestring_AddPortW:    db 'AddPortW',0
