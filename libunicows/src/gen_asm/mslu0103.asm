%include "dll_names.inc"

                    global __imp__ChangeDisplaySettingsExW@20
                    global _ChangeDisplaySettingsExW@20
                    global _Unicows_ChangeDisplaySettingsExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ChangeDisplaySettingsExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ChangeDisplaySettingsExW@20     ; place to save the pointer
                    push dword [_Unicows_ChangeDisplaySettingsExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_ChangeDisplaySettingsExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ChangeDisplaySettingsExW@20]

_ChangeDisplaySettingsExW@20:
                    jmp [__imp__ChangeDisplaySettingsExW@20]


                    section .data

__imp__ChangeDisplaySettingsExW@20:   dd unicows_initial_stub_ChangeDisplaySettingsExW
_Unicows_ChangeDisplaySettingsExW:      dd 0
namestring_ChangeDisplaySettingsExW:    db 'ChangeDisplaySettingsExW',0
