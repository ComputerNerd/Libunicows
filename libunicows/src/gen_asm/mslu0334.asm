%include "dll_names.inc"

                    global __imp__GetDateFormatW@24
                    global _GetDateFormatW@24
                    global _Unicows_GetDateFormatW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetDateFormatW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetDateFormatW@24     ; place to save the pointer
                    push dword [_Unicows_GetDateFormatW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetDateFormatW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetDateFormatW@24]

_GetDateFormatW@24:
                    jmp [__imp__GetDateFormatW@24]


                    section .data

__imp__GetDateFormatW@24:   dd unicows_initial_stub_GetDateFormatW
_Unicows_GetDateFormatW:      dd 0
namestring_GetDateFormatW:    db 'GetDateFormatW',0
