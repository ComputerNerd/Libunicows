%include "dll_names.inc"

                    global __imp__EnumFontFamiliesW@16
                    global _EnumFontFamiliesW@16
                    global _Unicows_EnumFontFamiliesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumFontFamiliesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumFontFamiliesW@16     ; place to save the pointer
                    push dword [_Unicows_EnumFontFamiliesW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_EnumFontFamiliesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumFontFamiliesW@16]

_EnumFontFamiliesW@16:
                    jmp [__imp__EnumFontFamiliesW@16]


                    section .data

__imp__EnumFontFamiliesW@16:   dd unicows_initial_stub_EnumFontFamiliesW
_Unicows_EnumFontFamiliesW:      dd 0
namestring_EnumFontFamiliesW:    db 'EnumFontFamiliesW',0
