%include "dll_names.inc"

                    global __imp__lstrlenW@4
                    global _lstrlenW@4
                    global _Unicows_lstrlenW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_lstrlenW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__lstrlenW@4     ; place to save the pointer
                    push dword [_Unicows_lstrlenW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_lstrlenW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__lstrlenW@4]

_lstrlenW@4:
                    jmp [__imp__lstrlenW@4]


                    section .data

__imp__lstrlenW@4:   dd unicows_initial_stub_lstrlenW
_Unicows_lstrlenW:      dd 0
namestring_lstrlenW:    db 'lstrlenW',0
