%include "dll_names.inc"

                    global __imp__ChangeDisplaySettingsW@8
                    global _ChangeDisplaySettingsW@8
                    global _Unicows_ChangeDisplaySettingsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ChangeDisplaySettingsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ChangeDisplaySettingsW@8     ; place to save the pointer
                    push dword [_Unicows_ChangeDisplaySettingsW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_ChangeDisplaySettingsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ChangeDisplaySettingsW@8]

_ChangeDisplaySettingsW@8:
                    jmp [__imp__ChangeDisplaySettingsW@8]


                    section .data

__imp__ChangeDisplaySettingsW@8:   dd unicows_initial_stub_ChangeDisplaySettingsW
_Unicows_ChangeDisplaySettingsW:      dd 0
namestring_ChangeDisplaySettingsW:    db 'ChangeDisplaySettingsW',0
