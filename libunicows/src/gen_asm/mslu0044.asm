%include "dll_names.inc"

                    global __imp__GetICMProfileW@12
                    global _GetICMProfileW@12
                    global _Unicows_GetICMProfileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetICMProfileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetICMProfileW@12     ; place to save the pointer
                    push dword [_Unicows_GetICMProfileW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetICMProfileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetICMProfileW@12]

_GetICMProfileW@12:
                    jmp [__imp__GetICMProfileW@12]


                    section .data

__imp__GetICMProfileW@12:   dd unicows_initial_stub_GetICMProfileW
_Unicows_GetICMProfileW:      dd 0
namestring_GetICMProfileW:    db 'GetICMProfileW',0
