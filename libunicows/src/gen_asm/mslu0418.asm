%include "dll_names.inc"

                    global __imp__lstrcmpiW@8
                    global _lstrcmpiW@8
                    global _Unicows_lstrcmpiW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_lstrcmpiW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__lstrcmpiW@8     ; place to save the pointer
                    push dword [_Unicows_lstrcmpiW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_lstrcmpiW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__lstrcmpiW@8]

_lstrcmpiW@8:
                    jmp [__imp__lstrcmpiW@8]


                    section .data

__imp__lstrcmpiW@8:   dd unicows_initial_stub_lstrcmpiW
_Unicows_lstrcmpiW:      dd 0
namestring_lstrcmpiW:    db 'lstrcmpiW',0
