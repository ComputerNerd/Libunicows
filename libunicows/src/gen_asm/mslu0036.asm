%include "dll_names.inc"

                    global __imp__GetCharABCWidthsFloatW@16
                    global _GetCharABCWidthsFloatW@16
                    global _Unicows_GetCharABCWidthsFloatW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetCharABCWidthsFloatW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCharABCWidthsFloatW@16     ; place to save the pointer
                    push dword [_Unicows_GetCharABCWidthsFloatW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetCharABCWidthsFloatW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetCharABCWidthsFloatW@16]

_GetCharABCWidthsFloatW@16:
                    jmp [__imp__GetCharABCWidthsFloatW@16]


                    section .data

__imp__GetCharABCWidthsFloatW@16:   dd unicows_initial_stub_GetCharABCWidthsFloatW
_Unicows_GetCharABCWidthsFloatW:      dd 0
namestring_GetCharABCWidthsFloatW:    db 'GetCharABCWidthsFloatW',0
