%include "dll_names.inc"

                    global __imp__EnumSystemCodePagesW@8
                    global _EnumSystemCodePagesW@8
                    global _Unicows_EnumSystemCodePagesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumSystemCodePagesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumSystemCodePagesW@8     ; place to save the pointer
                    push dword [_Unicows_EnumSystemCodePagesW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_EnumSystemCodePagesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumSystemCodePagesW@8]

_EnumSystemCodePagesW@8:
                    jmp [__imp__EnumSystemCodePagesW@8]


                    section .data

__imp__EnumSystemCodePagesW@8:   dd unicows_initial_stub_EnumSystemCodePagesW
_Unicows_EnumSystemCodePagesW:      dd 0
namestring_EnumSystemCodePagesW:    db 'EnumSystemCodePagesW',0
