%include "dll_names.inc"

                    global __imp__EnumSystemLocalesW@8
                    global _EnumSystemLocalesW@8
                    global _Unicows_EnumSystemLocalesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumSystemLocalesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumSystemLocalesW@8     ; place to save the pointer
                    push dword [_Unicows_EnumSystemLocalesW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_EnumSystemLocalesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumSystemLocalesW@8]

_EnumSystemLocalesW@8:
                    jmp [__imp__EnumSystemLocalesW@8]


                    section .data

__imp__EnumSystemLocalesW@8:   dd unicows_initial_stub_EnumSystemLocalesW
_Unicows_EnumSystemLocalesW:      dd 0
namestring_EnumSystemLocalesW:    db 'EnumSystemLocalesW',0
