%include "dll_names.inc"

                    global __imp__SystemParametersInfoW@16
                    global SystemParametersInfoW
                    global _SystemParametersInfoW@16
                    global _Unicows_SystemParametersInfoW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SystemParametersInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SystemParametersInfoW@16     ; place to save the pointer
                    push dword [_Unicows_SystemParametersInfoW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SystemParametersInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SystemParametersInfoW:
_SystemParametersInfoW@16:
                    jmp [__imp__SystemParametersInfoW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SystemParametersInfoW@16:   dd unicows_initial_stub_SystemParametersInfoW
_Unicows_SystemParametersInfoW:      dd 0
namestring_SystemParametersInfoW:    db 'SystemParametersInfoW',0
