%include "dll_names.inc"

                    global __imp__EnumPropsW@8
                    global _EnumPropsW@8
                    global _Unicows_EnumPropsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumPropsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPropsW@8     ; place to save the pointer
                    push dword [_Unicows_EnumPropsW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_EnumPropsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumPropsW@8]

_EnumPropsW@8:
                    jmp [__imp__EnumPropsW@8]


                    section .data

__imp__EnumPropsW@8:   dd unicows_initial_stub_EnumPropsW
_Unicows_EnumPropsW:      dd 0
namestring_EnumPropsW:    db 'EnumPropsW',0
