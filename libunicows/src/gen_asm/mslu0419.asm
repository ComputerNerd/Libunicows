%include "dll_names.inc"

                    global __imp__lstrcpyW@8
                    global _lstrcpyW@8
                    global _Unicows_lstrcpyW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_lstrcpyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__lstrcpyW@8     ; place to save the pointer
                    push dword [_Unicows_lstrcpyW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_lstrcpyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__lstrcpyW@8]

_lstrcpyW@8:
                    jmp [__imp__lstrcpyW@8]


                    section .data

__imp__lstrcpyW@8:   dd unicows_initial_stub_lstrcpyW
_Unicows_lstrcpyW:      dd 0
namestring_lstrcpyW:    db 'lstrcpyW',0
