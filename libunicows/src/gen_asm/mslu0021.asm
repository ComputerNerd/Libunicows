%include "dll_names.inc"

                    global __imp__CopyEnhMetaFileW@8
                    global _CopyEnhMetaFileW@8
                    global _Unicows_CopyEnhMetaFileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CopyEnhMetaFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CopyEnhMetaFileW@8     ; place to save the pointer
                    push dword [_Unicows_CopyEnhMetaFileW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_CopyEnhMetaFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CopyEnhMetaFileW@8]

_CopyEnhMetaFileW@8:
                    jmp [__imp__CopyEnhMetaFileW@8]


                    section .data

__imp__CopyEnhMetaFileW@8:   dd unicows_initial_stub_CopyEnhMetaFileW
_Unicows_CopyEnhMetaFileW:      dd 0
namestring_CopyEnhMetaFileW:    db 'CopyEnhMetaFileW',0