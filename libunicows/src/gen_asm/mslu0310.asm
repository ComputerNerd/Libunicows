%include "dll_names.inc"

                    global __imp__EnumDateFormatsExW@12
                    global _EnumDateFormatsExW@12
                    global _Unicows_EnumDateFormatsExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumDateFormatsExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumDateFormatsExW@12     ; place to save the pointer
                    push dword [_Unicows_EnumDateFormatsExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_EnumDateFormatsExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumDateFormatsExW@12]

_EnumDateFormatsExW@12:
                    jmp [__imp__EnumDateFormatsExW@12]


                    section .data

__imp__EnumDateFormatsExW@12:   dd unicows_initial_stub_EnumDateFormatsExW
_Unicows_EnumDateFormatsExW:      dd 0
namestring_EnumDateFormatsExW:    db 'EnumDateFormatsExW',0
