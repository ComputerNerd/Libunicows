%include "dll_names.inc"

                    global __imp__GetLogColorSpaceW@12
                    global _GetLogColorSpaceW@12
                    global _Unicows_GetLogColorSpaceW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetLogColorSpaceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetLogColorSpaceW@12     ; place to save the pointer
                    push dword [_Unicows_GetLogColorSpaceW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetLogColorSpaceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetLogColorSpaceW@12]

_GetLogColorSpaceW@12:
                    jmp [__imp__GetLogColorSpaceW@12]


                    section .data

__imp__GetLogColorSpaceW@12:   dd unicows_initial_stub_GetLogColorSpaceW
_Unicows_GetLogColorSpaceW:      dd 0
namestring_GetLogColorSpaceW:    db 'GetLogColorSpaceW',0
