%include "dll_names.inc"

                    global __imp__EnumDateFormatsW@12
                    global _EnumDateFormatsW@12
                    global _Unicows_EnumDateFormatsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumDateFormatsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumDateFormatsW@12     ; place to save the pointer
                    push dword [_Unicows_EnumDateFormatsW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_EnumDateFormatsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumDateFormatsW@12]

_EnumDateFormatsW@12:
                    jmp [__imp__EnumDateFormatsW@12]


                    section .data

__imp__EnumDateFormatsW@12:   dd unicows_initial_stub_EnumDateFormatsW
_Unicows_EnumDateFormatsW:      dd 0
namestring_EnumDateFormatsW:    db 'EnumDateFormatsW',0
