%include "dll_names.inc"

                    global __imp__CreateFontW@56
                    global _CreateFontW@56
                    global _Unicows_CreateFontW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateFontW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateFontW@56     ; place to save the pointer
                    push dword [_Unicows_CreateFontW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_CreateFontW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateFontW@56]

_CreateFontW@56:
                    jmp [__imp__CreateFontW@56]


                    section .data

__imp__CreateFontW@56:   dd unicows_initial_stub_CreateFontW
_Unicows_CreateFontW:      dd 0
namestring_CreateFontW:    db 'CreateFontW',0
