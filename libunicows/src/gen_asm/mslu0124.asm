%include "dll_names.inc"

                    global __imp__DdeCreateStringHandleW@12
                    global _DdeCreateStringHandleW@12
                    global _Unicows_DdeCreateStringHandleW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DdeCreateStringHandleW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DdeCreateStringHandleW@12     ; place to save the pointer
                    push dword [_Unicows_DdeCreateStringHandleW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DdeCreateStringHandleW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DdeCreateStringHandleW@12]

_DdeCreateStringHandleW@12:
                    jmp [__imp__DdeCreateStringHandleW@12]


                    section .data

__imp__DdeCreateStringHandleW@12:   dd unicows_initial_stub_DdeCreateStringHandleW
_Unicows_DdeCreateStringHandleW:      dd 0
namestring_DdeCreateStringHandleW:    db 'DdeCreateStringHandleW',0
