%include "dll_names.inc"

                    global __imp__DdeConnect@16
                    global _DdeConnect@16
                    global _Unicows_DdeConnect
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DdeConnect:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DdeConnect@16     ; place to save the pointer
                    push dword [_Unicows_DdeConnect]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DdeConnect      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DdeConnect@16]

_DdeConnect@16:
                    jmp [__imp__DdeConnect@16]


                    section .data

__imp__DdeConnect@16:   dd unicows_initial_stub_DdeConnect
_Unicows_DdeConnect:      dd 0
namestring_DdeConnect:    db 'DdeConnect',0
