%include "dll_names.inc"

                    global __imp__DdeQueryStringW@20
                    global _DdeQueryStringW@20
                    global _Unicows_DdeQueryStringW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DdeQueryStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DdeQueryStringW@20     ; place to save the pointer
                    push dword [_Unicows_DdeQueryStringW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DdeQueryStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DdeQueryStringW@20]

_DdeQueryStringW@20:
                    jmp [__imp__DdeQueryStringW@20]


                    section .data

__imp__DdeQueryStringW@20:   dd unicows_initial_stub_DdeQueryStringW
_Unicows_DdeQueryStringW:      dd 0
namestring_DdeQueryStringW:    db 'DdeQueryStringW',0
