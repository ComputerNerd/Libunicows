%include "dll_names.inc"

                    global __imp__EnumPropsExA@12
                    global _EnumPropsExA@12
                    global _Unicows_EnumPropsExA
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumPropsExA:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPropsExA@12     ; place to save the pointer
                    push dword [_Unicows_EnumPropsExA]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_EnumPropsExA      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumPropsExA@12]

_EnumPropsExA@12:
                    jmp [__imp__EnumPropsExA@12]


                    section .data

__imp__EnumPropsExA@12:   dd unicows_initial_stub_EnumPropsExA
_Unicows_EnumPropsExA:      dd 0
namestring_EnumPropsExA:    db 'EnumPropsExA',0
