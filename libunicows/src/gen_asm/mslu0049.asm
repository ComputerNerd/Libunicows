%include "dll_names.inc"

                    global __imp__GetOutlineTextMetricsW@12
                    global _GetOutlineTextMetricsW@12
                    global _Unicows_GetOutlineTextMetricsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetOutlineTextMetricsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetOutlineTextMetricsW@12     ; place to save the pointer
                    push dword [_Unicows_GetOutlineTextMetricsW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetOutlineTextMetricsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetOutlineTextMetricsW@12]

_GetOutlineTextMetricsW@12:
                    jmp [__imp__GetOutlineTextMetricsW@12]


                    section .data

__imp__GetOutlineTextMetricsW@12:   dd unicows_initial_stub_GetOutlineTextMetricsW
_Unicows_GetOutlineTextMetricsW:      dd 0
namestring_GetOutlineTextMetricsW:    db 'GetOutlineTextMetricsW',0
