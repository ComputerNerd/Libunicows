%include "dll_names.inc"

                    global __imp__GetFileVersionInfoW@16
                    global _GetFileVersionInfoW@16
                    global _Unicows_GetFileVersionInfoW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetFileVersionInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetFileVersionInfoW@16     ; place to save the pointer
                    push dword [_Unicows_GetFileVersionInfoW]      ; default proc, if any
                    push dword VERSION                  ; dll id
                    push dword namestring_GetFileVersionInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetFileVersionInfoW@16]

_GetFileVersionInfoW@16:
                    jmp [__imp__GetFileVersionInfoW@16]


                    section .data

__imp__GetFileVersionInfoW@16:   dd unicows_initial_stub_GetFileVersionInfoW
_Unicows_GetFileVersionInfoW:      dd 0
namestring_GetFileVersionInfoW:    db 'GetFileVersionInfoW',0
