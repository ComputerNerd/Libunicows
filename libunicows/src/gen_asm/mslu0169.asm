%include "dll_names.inc"

                    global __imp__GetWindowModuleFileNameW@12
                    global _GetWindowModuleFileNameW@12
                    global _Unicows_GetWindowModuleFileNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetWindowModuleFileNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetWindowModuleFileNameW@12     ; place to save the pointer
                    push dword [_Unicows_GetWindowModuleFileNameW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetWindowModuleFileNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetWindowModuleFileNameW@12]

_GetWindowModuleFileNameW@12:
                    jmp [__imp__GetWindowModuleFileNameW@12]


                    section .data

__imp__GetWindowModuleFileNameW@12:   dd unicows_initial_stub_GetWindowModuleFileNameW
_Unicows_GetWindowModuleFileNameW:      dd 0
namestring_GetWindowModuleFileNameW:    db 'GetWindowModuleFileNameW',0
