%include "dll_names.inc"

                    global __imp__DdeQueryConvInfo@12
                    global _DdeQueryConvInfo@12
                    global _Unicows_DdeQueryConvInfo
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DdeQueryConvInfo:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DdeQueryConvInfo@12     ; place to save the pointer
                    push dword [_Unicows_DdeQueryConvInfo]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DdeQueryConvInfo      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DdeQueryConvInfo@12]

_DdeQueryConvInfo@12:
                    jmp [__imp__DdeQueryConvInfo@12]


                    section .data

__imp__DdeQueryConvInfo@12:   dd unicows_initial_stub_DdeQueryConvInfo
_Unicows_DdeQueryConvInfo:      dd 0
namestring_DdeQueryConvInfo:    db 'DdeQueryConvInfo',0
