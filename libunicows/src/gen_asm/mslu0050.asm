%include "dll_names.inc"

                    global __imp__GetTextExtentExPointW@28
                    global _GetTextExtentExPointW@28
                    global _Unicows_GetTextExtentExPointW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetTextExtentExPointW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTextExtentExPointW@28     ; place to save the pointer
                    push dword [_Unicows_GetTextExtentExPointW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetTextExtentExPointW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetTextExtentExPointW@28]

_GetTextExtentExPointW@28:
                    jmp [__imp__GetTextExtentExPointW@28]


                    section .data

__imp__GetTextExtentExPointW@28:   dd unicows_initial_stub_GetTextExtentExPointW
_Unicows_GetTextExtentExPointW:      dd 0
namestring_GetTextExtentExPointW:    db 'GetTextExtentExPointW',0
