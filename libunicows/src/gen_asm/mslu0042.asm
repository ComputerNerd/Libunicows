%include "dll_names.inc"

                    global __imp__GetEnhMetaFileW@4
                    global _GetEnhMetaFileW@4
                    global _Unicows_GetEnhMetaFileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetEnhMetaFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetEnhMetaFileW@4     ; place to save the pointer
                    push dword [_Unicows_GetEnhMetaFileW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetEnhMetaFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetEnhMetaFileW@4]

_GetEnhMetaFileW@4:
                    jmp [__imp__GetEnhMetaFileW@4]


                    section .data

__imp__GetEnhMetaFileW@4:   dd unicows_initial_stub_GetEnhMetaFileW
_Unicows_GetEnhMetaFileW:      dd 0
namestring_GetEnhMetaFileW:    db 'GetEnhMetaFileW',0
