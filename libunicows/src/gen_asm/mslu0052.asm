%include "dll_names.inc"

                    global __imp__GetTextExtentPointW@16
                    global _GetTextExtentPointW@16
                    global _Unicows_GetTextExtentPointW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetTextExtentPointW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTextExtentPointW@16     ; place to save the pointer
                    push dword [_Unicows_GetTextExtentPointW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetTextExtentPointW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetTextExtentPointW@16]

_GetTextExtentPointW@16:
                    jmp [__imp__GetTextExtentPointW@16]


                    section .data

__imp__GetTextExtentPointW@16:   dd unicows_initial_stub_GetTextExtentPointW
_Unicows_GetTextExtentPointW:      dd 0
namestring_GetTextExtentPointW:    db 'GetTextExtentPointW',0
