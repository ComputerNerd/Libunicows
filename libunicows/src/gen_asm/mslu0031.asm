%include "dll_names.inc"

                    global __imp__EnumFontFamiliesExW@20
                    global _EnumFontFamiliesExW@20
                    global _Unicows_EnumFontFamiliesExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumFontFamiliesExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumFontFamiliesExW@20     ; place to save the pointer
                    push dword [_Unicows_EnumFontFamiliesExW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_EnumFontFamiliesExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumFontFamiliesExW@20]

_EnumFontFamiliesExW@20:
                    jmp [__imp__EnumFontFamiliesExW@20]


                    section .data

__imp__EnumFontFamiliesExW@20:   dd unicows_initial_stub_EnumFontFamiliesExW
_Unicows_EnumFontFamiliesExW:      dd 0
namestring_EnumFontFamiliesExW:    db 'EnumFontFamiliesExW',0
