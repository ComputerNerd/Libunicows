%include "dll_names.inc"

                    global __imp__GetCalendarInfoW@24
                    global _GetCalendarInfoW@24
                    global _Unicows_GetCalendarInfoW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetCalendarInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCalendarInfoW@24     ; place to save the pointer
                    push dword [_Unicows_GetCalendarInfoW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetCalendarInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetCalendarInfoW@24]

_GetCalendarInfoW@24:
                    jmp [__imp__GetCalendarInfoW@24]


                    section .data

__imp__GetCalendarInfoW@24:   dd unicows_initial_stub_GetCalendarInfoW
_Unicows_GetCalendarInfoW:      dd 0
namestring_GetCalendarInfoW:    db 'GetCalendarInfoW',0
