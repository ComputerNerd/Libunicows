%include "dll_names.inc"

                    global __imp__GetCurrencyFormatW@24
                    global _GetCurrencyFormatW@24
                    global _Unicows_GetCurrencyFormatW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetCurrencyFormatW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCurrencyFormatW@24     ; place to save the pointer
                    push dword [_Unicows_GetCurrencyFormatW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetCurrencyFormatW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetCurrencyFormatW@24]

_GetCurrencyFormatW@24:
                    jmp [__imp__GetCurrencyFormatW@24]


                    section .data

__imp__GetCurrencyFormatW@24:   dd unicows_initial_stub_GetCurrencyFormatW
_Unicows_GetCurrencyFormatW:      dd 0
namestring_GetCurrencyFormatW:    db 'GetCurrencyFormatW',0
