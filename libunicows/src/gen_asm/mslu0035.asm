%include "dll_names.inc"

                    global __imp__ExtTextOutW@32
                    global _ExtTextOutW@32
                    global _Unicows_ExtTextOutW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ExtTextOutW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ExtTextOutW@32     ; place to save the pointer
                    push dword [_Unicows_ExtTextOutW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_ExtTextOutW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ExtTextOutW@32]

_ExtTextOutW@32:
                    jmp [__imp__ExtTextOutW@32]


                    section .data

__imp__ExtTextOutW@32:   dd unicows_initial_stub_ExtTextOutW
_Unicows_ExtTextOutW:      dd 0
namestring_ExtTextOutW:    db 'ExtTextOutW',0