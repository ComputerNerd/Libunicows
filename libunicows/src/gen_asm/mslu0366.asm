%include "dll_names.inc"

                    global __imp__GetTimeFormatW@24
                    global _GetTimeFormatW@24
                    global _Unicows_GetTimeFormatW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetTimeFormatW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTimeFormatW@24     ; place to save the pointer
                    push dword [_Unicows_GetTimeFormatW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetTimeFormatW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetTimeFormatW@24]

_GetTimeFormatW@24:
                    jmp [__imp__GetTimeFormatW@24]


                    section .data

__imp__GetTimeFormatW@24:   dd unicows_initial_stub_GetTimeFormatW
_Unicows_GetTimeFormatW:      dd 0
namestring_GetTimeFormatW:    db 'GetTimeFormatW',0
