%include "dll_names.inc"

                    global __imp__lstrcpynW@12
                    global _lstrcpynW@12
                    global _Unicows_lstrcpynW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_lstrcpynW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__lstrcpynW@12     ; place to save the pointer
                    push dword [_Unicows_lstrcpynW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_lstrcpynW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__lstrcpynW@12]

_lstrcpynW@12:
                    jmp [__imp__lstrcpynW@12]


                    section .data

__imp__lstrcpynW@12:   dd unicows_initial_stub_lstrcpynW
_Unicows_lstrcpynW:      dd 0
namestring_lstrcpynW:    db 'lstrcpynW',0
