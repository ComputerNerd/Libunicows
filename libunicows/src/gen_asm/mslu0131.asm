%include "dll_names.inc"

                    global __imp__DefWindowProcW@16
                    global _DefWindowProcW@16
                    global _Unicows_DefWindowProcW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DefWindowProcW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DefWindowProcW@16     ; place to save the pointer
                    push dword [_Unicows_DefWindowProcW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DefWindowProcW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DefWindowProcW@16]

_DefWindowProcW@16:
                    jmp [__imp__DefWindowProcW@16]


                    section .data

__imp__DefWindowProcW@16:   dd unicows_initial_stub_DefWindowProcW
_Unicows_DefWindowProcW:      dd 0
namestring_DefWindowProcW:    db 'DefWindowProcW',0
