%include "dll_names.inc"

                    global __imp__RemoveFontResourceW@4
                    global _RemoveFontResourceW@4
                    global _Unicows_RemoveFontResourceW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RemoveFontResourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RemoveFontResourceW@4     ; place to save the pointer
                    push dword [_Unicows_RemoveFontResourceW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_RemoveFontResourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RemoveFontResourceW@4]

_RemoveFontResourceW@4:
                    jmp [__imp__RemoveFontResourceW@4]


                    section .data

__imp__RemoveFontResourceW@4:   dd unicows_initial_stub_RemoveFontResourceW
_Unicows_RemoveFontResourceW:      dd 0
namestring_RemoveFontResourceW:    db 'RemoveFontResourceW',0
