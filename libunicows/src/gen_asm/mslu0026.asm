%include "dll_names.inc"

                    global __imp__CreateFontIndirectW@4
                    global _CreateFontIndirectW@4
                    global _Unicows_CreateFontIndirectW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateFontIndirectW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateFontIndirectW@4     ; place to save the pointer
                    push dword [_Unicows_CreateFontIndirectW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_CreateFontIndirectW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateFontIndirectW@4]

_CreateFontIndirectW@4:
                    jmp [__imp__CreateFontIndirectW@4]


                    section .data

__imp__CreateFontIndirectW@4:   dd unicows_initial_stub_CreateFontIndirectW
_Unicows_CreateFontIndirectW:      dd 0
namestring_CreateFontIndirectW:    db 'CreateFontIndirectW',0
