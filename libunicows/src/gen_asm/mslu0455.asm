%include "dll_names.inc"

                    global __imp__DeletePortW@12
                    global DeletePortW
                    global _DeletePortW@12
                    global _Unicows_DeletePortW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DeletePortW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DeletePortW@12     ; place to save the pointer
                    push dword [_Unicows_DeletePortW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_DeletePortW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DeletePortW:
_DeletePortW@12:
                    jmp [__imp__DeletePortW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DeletePortW@12:   dd unicows_initial_stub_DeletePortW
_Unicows_DeletePortW:      dd 0
namestring_DeletePortW:    db 'DeletePortW',0
