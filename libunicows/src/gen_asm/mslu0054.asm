%include "dll_names.inc"

                    global __imp__GetTextMetricsW@8
                    global _GetTextMetricsW@8
                    global _Unicows_GetTextMetricsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetTextMetricsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTextMetricsW@8     ; place to save the pointer
                    push dword [_Unicows_GetTextMetricsW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetTextMetricsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetTextMetricsW@8]

_GetTextMetricsW@8:
                    jmp [__imp__GetTextMetricsW@8]


                    section .data

__imp__GetTextMetricsW@8:   dd unicows_initial_stub_GetTextMetricsW
_Unicows_GetTextMetricsW:      dd 0
namestring_GetTextMetricsW:    db 'GetTextMetricsW',0
