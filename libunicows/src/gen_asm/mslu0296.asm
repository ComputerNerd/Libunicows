%include "dll_names.inc"

                    global __imp__CopyFileExW@24
                    global _CopyFileExW@24
                    global _Unicows_CopyFileExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CopyFileExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CopyFileExW@24     ; place to save the pointer
                    push dword [_Unicows_CopyFileExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CopyFileExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CopyFileExW@24]

_CopyFileExW@24:
                    jmp [__imp__CopyFileExW@24]


                    section .data

__imp__CopyFileExW@24:   dd unicows_initial_stub_CopyFileExW
_Unicows_CopyFileExW:      dd 0
namestring_CopyFileExW:    db 'CopyFileExW',0
