%include "dll_names.inc"

                    global __imp__EnumDisplayDevicesW@16
                    global _EnumDisplayDevicesW@16
                    global _Unicows_EnumDisplayDevicesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumDisplayDevicesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumDisplayDevicesW@16     ; place to save the pointer
                    push dword [_Unicows_EnumDisplayDevicesW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_EnumDisplayDevicesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumDisplayDevicesW@16]

_EnumDisplayDevicesW@16:
                    jmp [__imp__EnumDisplayDevicesW@16]


                    section .data

__imp__EnumDisplayDevicesW@16:   dd unicows_initial_stub_EnumDisplayDevicesW
_Unicows_EnumDisplayDevicesW:      dd 0
namestring_EnumDisplayDevicesW:    db 'EnumDisplayDevicesW',0
