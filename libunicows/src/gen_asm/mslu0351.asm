%include "dll_names.inc"

                    global __imp__GetModuleHandleW@4
                    global _GetModuleHandleW@4
                    global _Unicows_GetModuleHandleW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetModuleHandleW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetModuleHandleW@4     ; place to save the pointer
                    push dword [_Unicows_GetModuleHandleW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetModuleHandleW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetModuleHandleW@4]

_GetModuleHandleW@4:
                    jmp [__imp__GetModuleHandleW@4]


                    section .data

__imp__GetModuleHandleW@4:   dd unicows_initial_stub_GetModuleHandleW
_Unicows_GetModuleHandleW:      dd 0
namestring_GetModuleHandleW:    db 'GetModuleHandleW',0
