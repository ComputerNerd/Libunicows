%include "dll_names.inc"

                    global __imp__UpdateResourceW@24
                    global _UpdateResourceW@24
                    global _Unicows_UpdateResourceW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_UpdateResourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__UpdateResourceW@24     ; place to save the pointer
                    push dword [_Unicows_UpdateResourceW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_UpdateResourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__UpdateResourceW@24]

_UpdateResourceW@24:
                    jmp [__imp__UpdateResourceW@24]


                    section .data

__imp__UpdateResourceW@24:   dd unicows_initial_stub_UpdateResourceW
_Unicows_UpdateResourceW:      dd 0
namestring_UpdateResourceW:    db 'UpdateResourceW',0
