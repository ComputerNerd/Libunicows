%include "dll_names.inc"

                    global __imp__SetWindowsHookW@8
                    global _SetWindowsHookW@8
                    global _Unicows_SetWindowsHookW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetWindowsHookW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetWindowsHookW@8     ; place to save the pointer
                    push dword [_Unicows_SetWindowsHookW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetWindowsHookW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetWindowsHookW@8]

_SetWindowsHookW@8:
                    jmp [__imp__SetWindowsHookW@8]


                    section .data

__imp__SetWindowsHookW@8:   dd unicows_initial_stub_SetWindowsHookW
_Unicows_SetWindowsHookW:      dd 0
namestring_SetWindowsHookW:    db 'SetWindowsHookW',0
