%include "dll_names.inc"

                    global __imp__GetLocaleInfoW@16
                    global _GetLocaleInfoW@16
                    global _Unicows_GetLocaleInfoW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetLocaleInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetLocaleInfoW@16     ; place to save the pointer
                    push dword [_Unicows_GetLocaleInfoW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetLocaleInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetLocaleInfoW@16]

_GetLocaleInfoW@16:
                    jmp [__imp__GetLocaleInfoW@16]


                    section .data

__imp__GetLocaleInfoW@16:   dd unicows_initial_stub_GetLocaleInfoW
_Unicows_GetLocaleInfoW:      dd 0
namestring_GetLocaleInfoW:    db 'GetLocaleInfoW',0
