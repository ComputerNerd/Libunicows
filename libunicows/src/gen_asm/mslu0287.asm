%include "dll_names.inc"

                    global __imp__BeginUpdateResourceW@8
                    global _BeginUpdateResourceW@8
                    global _Unicows_BeginUpdateResourceW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_BeginUpdateResourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__BeginUpdateResourceW@8     ; place to save the pointer
                    push dword [_Unicows_BeginUpdateResourceW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_BeginUpdateResourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__BeginUpdateResourceW@8]

_BeginUpdateResourceW@8:
                    jmp [__imp__BeginUpdateResourceW@8]


                    section .data

__imp__BeginUpdateResourceW@8:   dd unicows_initial_stub_BeginUpdateResourceW
_Unicows_BeginUpdateResourceW:      dd 0
namestring_BeginUpdateResourceW:    db 'BeginUpdateResourceW',0
