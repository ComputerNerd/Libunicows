%include "dll_names.inc"

                    global __imp__SendNotifyMessageW@16
                    global SendNotifyMessageW
                    global _SendNotifyMessageW@16
                    global _Unicows_SendNotifyMessageW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SendNotifyMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SendNotifyMessageW@16     ; place to save the pointer
                    push dword [_Unicows_SendNotifyMessageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SendNotifyMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SendNotifyMessageW:
_SendNotifyMessageW@16:
                    jmp [__imp__SendNotifyMessageW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SendNotifyMessageW@16:   dd unicows_initial_stub_SendNotifyMessageW
_Unicows_SendNotifyMessageW:      dd 0
namestring_SendNotifyMessageW:    db 'SendNotifyMessageW',0
