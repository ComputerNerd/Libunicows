%include "dll_names.inc"

                    global __imp__EnumDisplaySettingsExW@16
                    global _EnumDisplaySettingsExW@16
                    global _Unicows_EnumDisplaySettingsExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumDisplaySettingsExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumDisplaySettingsExW@16     ; place to save the pointer
                    push dword [_Unicows_EnumDisplaySettingsExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_EnumDisplaySettingsExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumDisplaySettingsExW@16]

_EnumDisplaySettingsExW@16:
                    jmp [__imp__EnumDisplaySettingsExW@16]


                    section .data

__imp__EnumDisplaySettingsExW@16:   dd unicows_initial_stub_EnumDisplaySettingsExW
_Unicows_EnumDisplaySettingsExW:      dd 0
namestring_EnumDisplaySettingsExW:    db 'EnumDisplaySettingsExW',0
