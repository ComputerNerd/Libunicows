%include "dll_names.inc"

                    global __imp__GetOpenFileNameW@4
                    global _GetOpenFileNameW@4
                    global _Unicows_GetOpenFileNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetOpenFileNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetOpenFileNameW@4     ; place to save the pointer
                    push dword [_Unicows_GetOpenFileNameW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_GetOpenFileNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetOpenFileNameW@4]

_GetOpenFileNameW@4:
                    jmp [__imp__GetOpenFileNameW@4]


                    section .data

__imp__GetOpenFileNameW@4:   dd unicows_initial_stub_GetOpenFileNameW
_Unicows_GetOpenFileNameW:      dd 0
namestring_GetOpenFileNameW:    db 'GetOpenFileNameW',0
