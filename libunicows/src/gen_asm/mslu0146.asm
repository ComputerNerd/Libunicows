%include "dll_names.inc"

                    global __imp__EnumDisplaySettingsW@12
                    global _EnumDisplaySettingsW@12
                    global _Unicows_EnumDisplaySettingsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumDisplaySettingsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumDisplaySettingsW@12     ; place to save the pointer
                    push dword [_Unicows_EnumDisplaySettingsW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_EnumDisplaySettingsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumDisplaySettingsW@12]

_EnumDisplaySettingsW@12:
                    jmp [__imp__EnumDisplaySettingsW@12]


                    section .data

__imp__EnumDisplaySettingsW@12:   dd unicows_initial_stub_EnumDisplaySettingsW
_Unicows_EnumDisplaySettingsW:      dd 0
namestring_EnumDisplaySettingsW:    db 'EnumDisplaySettingsW',0
