%include "dll_names.inc"

                    global __imp__CompareStringW@24
                    global _CompareStringW@24
                    global _Unicows_CompareStringW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CompareStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CompareStringW@24     ; place to save the pointer
                    push dword [_Unicows_CompareStringW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CompareStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CompareStringW@24]

_CompareStringW@24:
                    jmp [__imp__CompareStringW@24]


                    section .data

__imp__CompareStringW@24:   dd unicows_initial_stub_CompareStringW
_Unicows_CompareStringW:      dd 0
namestring_CompareStringW:    db 'CompareStringW',0
