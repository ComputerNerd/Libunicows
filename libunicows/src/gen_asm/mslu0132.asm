%include "dll_names.inc"

                    global __imp__DialogBoxIndirectParamW@20
                    global DialogBoxIndirectParamW
                    global _DialogBoxIndirectParamW@20
                    global _Unicows_DialogBoxIndirectParamW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DialogBoxIndirectParamW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DialogBoxIndirectParamW@20     ; place to save the pointer
                    push dword [_Unicows_DialogBoxIndirectParamW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DialogBoxIndirectParamW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DialogBoxIndirectParamW:
_DialogBoxIndirectParamW@20:
                    jmp [__imp__DialogBoxIndirectParamW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DialogBoxIndirectParamW@20:   dd unicows_initial_stub_DialogBoxIndirectParamW
_Unicows_DialogBoxIndirectParamW:      dd 0
namestring_DialogBoxIndirectParamW:    db 'DialogBoxIndirectParamW',0
