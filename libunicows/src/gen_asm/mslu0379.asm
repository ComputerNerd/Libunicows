%include "dll_names.inc"

                    global __imp__MultiByteToWideChar@24
                    global _MultiByteToWideChar@24
                    global _Unicows_MultiByteToWideChar
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_MultiByteToWideChar:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MultiByteToWideChar@24     ; place to save the pointer
                    push dword [_Unicows_MultiByteToWideChar]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_MultiByteToWideChar      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__MultiByteToWideChar@24]

_MultiByteToWideChar@24:
                    jmp [__imp__MultiByteToWideChar@24]


                    section .data

__imp__MultiByteToWideChar@24:   dd unicows_initial_stub_MultiByteToWideChar
_Unicows_MultiByteToWideChar:      dd 0
namestring_MultiByteToWideChar:    db 'MultiByteToWideChar',0
