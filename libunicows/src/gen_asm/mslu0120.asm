%include "dll_names.inc"

                    global __imp__CreateMDIWindowW@40
                    global _CreateMDIWindowW@40
                    global _Unicows_CreateMDIWindowW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateMDIWindowW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateMDIWindowW@40     ; place to save the pointer
                    push dword [_Unicows_CreateMDIWindowW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CreateMDIWindowW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateMDIWindowW@40]

_CreateMDIWindowW@40:
                    jmp [__imp__CreateMDIWindowW@40]


                    section .data

__imp__CreateMDIWindowW@40:   dd unicows_initial_stub_CreateMDIWindowW
_Unicows_CreateMDIWindowW:      dd 0
namestring_CreateMDIWindowW:    db 'CreateMDIWindowW',0
