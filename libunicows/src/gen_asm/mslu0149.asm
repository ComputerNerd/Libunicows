%include "dll_names.inc"

                    global __imp__FindWindowW@8
                    global _FindWindowW@8
                    global _Unicows_FindWindowW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_FindWindowW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindWindowW@8     ; place to save the pointer
                    push dword [_Unicows_FindWindowW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_FindWindowW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__FindWindowW@8]

_FindWindowW@8:
                    jmp [__imp__FindWindowW@8]


                    section .data

__imp__FindWindowW@8:   dd unicows_initial_stub_FindWindowW
_Unicows_FindWindowW:      dd 0
namestring_FindWindowW:    db 'FindWindowW',0
