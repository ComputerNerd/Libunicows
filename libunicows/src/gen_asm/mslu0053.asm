%include "dll_names.inc"

                    global __imp__GetTextFaceW@12
                    global _GetTextFaceW@12
                    global _Unicows_GetTextFaceW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetTextFaceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTextFaceW@12     ; place to save the pointer
                    push dword [_Unicows_GetTextFaceW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetTextFaceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetTextFaceW@12]

_GetTextFaceW@12:
                    jmp [__imp__GetTextFaceW@12]


                    section .data

__imp__GetTextFaceW@12:   dd unicows_initial_stub_GetTextFaceW
_Unicows_GetTextFaceW:      dd 0
namestring_GetTextFaceW:    db 'GetTextFaceW',0
