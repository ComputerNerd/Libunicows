%include "dll_names.inc"

                    global __imp__SendMessageCallbackW@24
                    global SendMessageCallbackW
                    global _SendMessageCallbackW@24
                    global _Unicows_SendMessageCallbackW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SendMessageCallbackW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SendMessageCallbackW@24     ; place to save the pointer
                    push dword [_Unicows_SendMessageCallbackW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SendMessageCallbackW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SendMessageCallbackW:
_SendMessageCallbackW@24:
                    jmp [__imp__SendMessageCallbackW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SendMessageCallbackW@24:   dd unicows_initial_stub_SendMessageCallbackW
_Unicows_SendMessageCallbackW:      dd 0
namestring_SendMessageCallbackW:    db 'SendMessageCallbackW',0
