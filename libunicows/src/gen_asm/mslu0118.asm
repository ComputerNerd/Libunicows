%include "dll_names.inc"

                    global __imp__CreateDialogIndirectParamW@20
                    global _CreateDialogIndirectParamW@20
                    global _Unicows_CreateDialogIndirectParamW
                  
                    extern _LoadUnicowsSymbol

                    section .text

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

                    ; ...and skip to it
                    jmp [__imp__CreateDialogIndirectParamW@20]

_CreateDialogIndirectParamW@20:
                    jmp [__imp__CreateDialogIndirectParamW@20]


                    section .data

__imp__CreateDialogIndirectParamW@20:   dd unicows_initial_stub_CreateDialogIndirectParamW
_Unicows_CreateDialogIndirectParamW:      dd 0
namestring_CreateDialogIndirectParamW:    db 'CreateDialogIndirectParamW',0
