%include "dll_names.inc"

                    global __imp__EnumPropsA@8
                    global _EnumPropsA@8
                    global _Unicows_EnumPropsA
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumPropsA:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPropsA@8     ; place to save the pointer
                    push dword [_Unicows_EnumPropsA]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_EnumPropsA      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumPropsA@8]

_EnumPropsA@8:
                    jmp [__imp__EnumPropsA@8]


                    section .data

__imp__EnumPropsA@8:   dd unicows_initial_stub_EnumPropsA
_Unicows_EnumPropsA:      dd 0
namestring_EnumPropsA:    db 'EnumPropsA',0
