%include "dll_names.inc"

                    global __imp__EnumPropsExW@12
                    global _EnumPropsExW@12
                    global _Unicows_EnumPropsExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumPropsExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPropsExW@12     ; place to save the pointer
                    push dword [_Unicows_EnumPropsExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_EnumPropsExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumPropsExW@12]

_EnumPropsExW@12:
                    jmp [__imp__EnumPropsExW@12]


                    section .data

__imp__EnumPropsExW@12:   dd unicows_initial_stub_EnumPropsExW
_Unicows_EnumPropsExW:      dd 0
namestring_EnumPropsExW:    db 'EnumPropsExW',0
