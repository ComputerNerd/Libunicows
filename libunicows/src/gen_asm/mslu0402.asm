%include "dll_names.inc"

                    global __imp__SetLocaleInfoW@12
                    global _SetLocaleInfoW@12
                    global _Unicows_SetLocaleInfoW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetLocaleInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetLocaleInfoW@12     ; place to save the pointer
                    push dword [_Unicows_SetLocaleInfoW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SetLocaleInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetLocaleInfoW@12]

_SetLocaleInfoW@12:
                    jmp [__imp__SetLocaleInfoW@12]


                    section .data

__imp__SetLocaleInfoW@12:   dd unicows_initial_stub_SetLocaleInfoW
_Unicows_SetLocaleInfoW:      dd 0
namestring_SetLocaleInfoW:    db 'SetLocaleInfoW',0
