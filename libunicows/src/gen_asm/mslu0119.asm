%include "dll_names.inc"

                    global __imp__CreateDialogParamW@20
                    global _CreateDialogParamW@20
                    global _Unicows_CreateDialogParamW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateDialogParamW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateDialogParamW@20     ; place to save the pointer
                    push dword [_Unicows_CreateDialogParamW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CreateDialogParamW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateDialogParamW@20]

_CreateDialogParamW@20:
                    jmp [__imp__CreateDialogParamW@20]


                    section .data

__imp__CreateDialogParamW@20:   dd unicows_initial_stub_CreateDialogParamW
_Unicows_CreateDialogParamW:      dd 0
namestring_CreateDialogParamW:    db 'CreateDialogParamW',0
