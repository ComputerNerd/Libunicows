%include "dll_names.inc"

                    global __imp__CreateDialogIndirectParamW@20
                    global CreateDialogIndirectParamW
                    global _CreateDialogIndirectParamW@20
                    global _Unicows_CreateDialogIndirectParamW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateDialogIndirectParamW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateDialogIndirectParamW@20     ; place to save the pointer
                    push dword [_Unicows_CreateDialogIndirectParamW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CreateDialogIndirectParamW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateDialogIndirectParamW:
_CreateDialogIndirectParamW@20:
                    jmp [__imp__CreateDialogIndirectParamW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateDialogIndirectParamW@20:   dd unicows_initial_stub_CreateDialogIndirectParamW
_Unicows_CreateDialogIndirectParamW:      dd 0
namestring_CreateDialogIndirectParamW:    db 'CreateDialogIndirectParamW',0
