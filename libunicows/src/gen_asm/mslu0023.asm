%include "dll_names.inc"

                    global __imp__CreateColorSpaceW@4
                    global _CreateColorSpaceW@4
                    global _Unicows_CreateColorSpaceW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateColorSpaceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateColorSpaceW@4     ; place to save the pointer
                    push dword [_Unicows_CreateColorSpaceW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_CreateColorSpaceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateColorSpaceW@4]

_CreateColorSpaceW@4:
                    jmp [__imp__CreateColorSpaceW@4]


                    section .data

__imp__CreateColorSpaceW@4:   dd unicows_initial_stub_CreateColorSpaceW
_Unicows_CreateColorSpaceW:      dd 0
namestring_CreateColorSpaceW:    db 'CreateColorSpaceW',0
