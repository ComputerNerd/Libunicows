%include "dll_names.inc"

                    global __imp__EnumCalendarInfoW@16
                    global _EnumCalendarInfoW@16
                    global _Unicows_EnumCalendarInfoW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumCalendarInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumCalendarInfoW@16     ; place to save the pointer
                    push dword [_Unicows_EnumCalendarInfoW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_EnumCalendarInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumCalendarInfoW@16]

_EnumCalendarInfoW@16:
                    jmp [__imp__EnumCalendarInfoW@16]


                    section .data

__imp__EnumCalendarInfoW@16:   dd unicows_initial_stub_EnumCalendarInfoW
_Unicows_EnumCalendarInfoW:      dd 0
namestring_EnumCalendarInfoW:    db 'EnumCalendarInfoW',0
