%include "dll_names.inc"

                    global __imp__IsValidCodePage@4
                    global _IsValidCodePage@4
                    global _Unicows_IsValidCodePage
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_IsValidCodePage:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsValidCodePage@4     ; place to save the pointer
                    push dword [_Unicows_IsValidCodePage]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_IsValidCodePage      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__IsValidCodePage@4]

_IsValidCodePage@4:
                    jmp [__imp__IsValidCodePage@4]


                    section .data

__imp__IsValidCodePage@4:   dd unicows_initial_stub_IsValidCodePage
_Unicows_IsValidCodePage:      dd 0
namestring_IsValidCodePage:    db 'IsValidCodePage',0
