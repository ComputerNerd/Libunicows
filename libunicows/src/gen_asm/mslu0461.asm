%include "dll_names.inc"

                    global __imp__EnumMonitorsW@24
                    global _EnumMonitorsW@24
                    global _Unicows_EnumMonitorsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumMonitorsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumMonitorsW@24     ; place to save the pointer
                    push dword [_Unicows_EnumMonitorsW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_EnumMonitorsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumMonitorsW@24]

_EnumMonitorsW@24:
                    jmp [__imp__EnumMonitorsW@24]


                    section .data

__imp__EnumMonitorsW@24:   dd unicows_initial_stub_EnumMonitorsW
_Unicows_EnumMonitorsW:      dd 0
namestring_EnumMonitorsW:    db 'EnumMonitorsW',0
