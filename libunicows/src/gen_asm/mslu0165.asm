%include "dll_names.inc"

                    global __imp__GetMessageW@16
                    global GetMessageW
                    global _GetMessageW@16
                    global _Unicows_GetMessageW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetMessageW@16     ; place to save the pointer
                    push dword [_Unicows_GetMessageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetMessageW:
_GetMessageW@16:
                    jmp [__imp__GetMessageW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetMessageW@16:   dd unicows_initial_stub_GetMessageW
_Unicows_GetMessageW:      dd 0
namestring_GetMessageW:    db 'GetMessageW',0
