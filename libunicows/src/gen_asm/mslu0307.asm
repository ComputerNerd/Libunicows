%include "dll_names.inc"

                    global __imp__EndUpdateResourceW@8
                    global _EndUpdateResourceW@8
                    global _Unicows_EndUpdateResourceW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EndUpdateResourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EndUpdateResourceW@8     ; place to save the pointer
                    push dword [_Unicows_EndUpdateResourceW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_EndUpdateResourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EndUpdateResourceW@8]

_EndUpdateResourceW@8:
                    jmp [__imp__EndUpdateResourceW@8]


                    section .data

__imp__EndUpdateResourceW@8:   dd unicows_initial_stub_EndUpdateResourceW
_Unicows_EndUpdateResourceW:      dd 0
namestring_EndUpdateResourceW:    db 'EndUpdateResourceW',0
