%include "dll_names.inc"

                    global __imp__EnumCalendarInfoExW@16
                    global _EnumCalendarInfoExW@16
                    global _Unicows_EnumCalendarInfoExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumCalendarInfoExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumCalendarInfoExW@16     ; place to save the pointer
                    push dword [_Unicows_EnumCalendarInfoExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_EnumCalendarInfoExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumCalendarInfoExW@16]

_EnumCalendarInfoExW@16:
                    jmp [__imp__EnumCalendarInfoExW@16]


                    section .data

__imp__EnumCalendarInfoExW@16:   dd unicows_initial_stub_EnumCalendarInfoExW
_Unicows_EnumCalendarInfoExW:      dd 0
namestring_EnumCalendarInfoExW:    db 'EnumCalendarInfoExW',0
