%include "dll_names.inc"

                    global __imp__GetKerningPairsW@12
                    global _GetKerningPairsW@12
                    global _Unicows_GetKerningPairsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetKerningPairsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetKerningPairsW@12     ; place to save the pointer
                    push dword [_Unicows_GetKerningPairsW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetKerningPairsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetKerningPairsW@12]

_GetKerningPairsW@12:
                    jmp [__imp__GetKerningPairsW@12]


                    section .data

__imp__GetKerningPairsW@12:   dd unicows_initial_stub_GetKerningPairsW
_Unicows_GetKerningPairsW:      dd 0
namestring_GetKerningPairsW:    db 'GetKerningPairsW',0
