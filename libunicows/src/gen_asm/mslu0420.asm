%include "dll_names.inc"

                    global __imp__lstrcatW@8
                    global _lstrcatW@8
                    global _Unicows_lstrcatW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_lstrcatW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__lstrcatW@8     ; place to save the pointer
                    push dword [_Unicows_lstrcatW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_lstrcatW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__lstrcatW@8]

_lstrcatW@8:
                    jmp [__imp__lstrcatW@8]


                    section .data

__imp__lstrcatW@8:   dd unicows_initial_stub_lstrcatW
_Unicows_lstrcatW:      dd 0
namestring_lstrcatW:    db 'lstrcatW',0
