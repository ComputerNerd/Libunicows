%include "dll_names.inc"

                    global __imp__CopyMetaFileW@8
                    global _CopyMetaFileW@8
                    global _Unicows_CopyMetaFileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CopyMetaFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CopyMetaFileW@8     ; place to save the pointer
                    push dword [_Unicows_CopyMetaFileW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_CopyMetaFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CopyMetaFileW@8]

_CopyMetaFileW@8:
                    jmp [__imp__CopyMetaFileW@8]


                    section .data

__imp__CopyMetaFileW@8:   dd unicows_initial_stub_CopyMetaFileW
_Unicows_CopyMetaFileW:      dd 0
namestring_CopyMetaFileW:    db 'CopyMetaFileW',0
