%include "dll_names.inc"

                    global __imp__IsDialogMessageW@8
                    global _IsDialogMessageW@8
                    global _Unicows_IsDialogMessageW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_IsDialogMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsDialogMessageW@8     ; place to save the pointer
                    push dword [_Unicows_IsDialogMessageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_IsDialogMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__IsDialogMessageW@8]

_IsDialogMessageW@8:
                    jmp [__imp__IsDialogMessageW@8]


                    section .data

__imp__IsDialogMessageW@8:   dd unicows_initial_stub_IsDialogMessageW
_Unicows_IsDialogMessageW:      dd 0
namestring_IsDialogMessageW:    db 'IsDialogMessageW',0
