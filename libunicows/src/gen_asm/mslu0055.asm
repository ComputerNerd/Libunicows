%include "dll_names.inc"

                    global __imp__PolyTextOutW@12
                    global _PolyTextOutW@12
                    global _Unicows_PolyTextOutW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_PolyTextOutW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__PolyTextOutW@12     ; place to save the pointer
                    push dword [_Unicows_PolyTextOutW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_PolyTextOutW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__PolyTextOutW@12]

_PolyTextOutW@12:
                    jmp [__imp__PolyTextOutW@12]


                    section .data

__imp__PolyTextOutW@12:   dd unicows_initial_stub_PolyTextOutW
_Unicows_PolyTextOutW:      dd 0
namestring_PolyTextOutW:    db 'PolyTextOutW',0
