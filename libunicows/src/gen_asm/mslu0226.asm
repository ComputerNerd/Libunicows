%include "dll_names.inc"

                    global __imp__SetWindowsHookExW@16
                    global _SetWindowsHookExW@16
                    global _Unicows_SetWindowsHookExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetWindowsHookExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetWindowsHookExW@16     ; place to save the pointer
                    push dword [_Unicows_SetWindowsHookExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetWindowsHookExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetWindowsHookExW@16]

_SetWindowsHookExW@16:
                    jmp [__imp__SetWindowsHookExW@16]


                    section .data

__imp__SetWindowsHookExW@16:   dd unicows_initial_stub_SetWindowsHookExW
_Unicows_SetWindowsHookExW:      dd 0
namestring_SetWindowsHookExW:    db 'SetWindowsHookExW',0
