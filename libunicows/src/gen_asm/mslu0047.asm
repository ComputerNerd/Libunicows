%include "dll_names.inc"

                    global __imp__GetMetaFileW@4
                    global _GetMetaFileW@4
                    global _Unicows_GetMetaFileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetMetaFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetMetaFileW@4     ; place to save the pointer
                    push dword [_Unicows_GetMetaFileW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetMetaFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetMetaFileW@4]

_GetMetaFileW@4:
                    jmp [__imp__GetMetaFileW@4]


                    section .data

__imp__GetMetaFileW@4:   dd unicows_initial_stub_GetMetaFileW
_Unicows_GetMetaFileW:      dd 0
namestring_GetMetaFileW:    db 'GetMetaFileW',0
