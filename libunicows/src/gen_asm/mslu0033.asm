%include "dll_names.inc"

                    global __imp__EnumFontsW@16
                    global _EnumFontsW@16
                    global _Unicows_EnumFontsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumFontsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumFontsW@16     ; place to save the pointer
                    push dword [_Unicows_EnumFontsW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_EnumFontsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumFontsW@16]

_EnumFontsW@16:
                    jmp [__imp__EnumFontsW@16]


                    section .data

__imp__EnumFontsW@16:   dd unicows_initial_stub_EnumFontsW
_Unicows_EnumFontsW:      dd 0
namestring_EnumFontsW:    db 'EnumFontsW',0
