%include "dll_names.inc"

                    global __imp__GetModuleFileNameW@12
                    global _GetModuleFileNameW@12
                    global _Unicows_GetModuleFileNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetModuleFileNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetModuleFileNameW@12     ; place to save the pointer
                    push dword [_Unicows_GetModuleFileNameW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetModuleFileNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetModuleFileNameW@12]

_GetModuleFileNameW@12:
                    jmp [__imp__GetModuleFileNameW@12]


                    section .data

__imp__GetModuleFileNameW@12:   dd unicows_initial_stub_GetModuleFileNameW
_Unicows_GetModuleFileNameW:      dd 0
namestring_GetModuleFileNameW:    db 'GetModuleFileNameW',0
