%include "dll_names.inc"

                    global __imp__EnumTimeFormatsW@12
                    global _EnumTimeFormatsW@12
                    global _Unicows_EnumTimeFormatsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumTimeFormatsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumTimeFormatsW@12     ; place to save the pointer
                    push dword [_Unicows_EnumTimeFormatsW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_EnumTimeFormatsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumTimeFormatsW@12]

_EnumTimeFormatsW@12:
                    jmp [__imp__EnumTimeFormatsW@12]


                    section .data

__imp__EnumTimeFormatsW@12:   dd unicows_initial_stub_EnumTimeFormatsW
_Unicows_EnumTimeFormatsW:      dd 0
namestring_EnumTimeFormatsW:    db 'EnumTimeFormatsW',0
