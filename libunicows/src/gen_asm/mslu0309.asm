%include "dll_names.inc"

                    global __imp__DeleteFileW@4
                    global _DeleteFileW@4
                    global _Unicows_DeleteFileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DeleteFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DeleteFileW@4     ; place to save the pointer
                    push dword [_Unicows_DeleteFileW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_DeleteFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DeleteFileW@4]

_DeleteFileW@4:
                    jmp [__imp__DeleteFileW@4]


                    section .data

__imp__DeleteFileW@4:   dd unicows_initial_stub_DeleteFileW
_Unicows_DeleteFileW:      dd 0
namestring_DeleteFileW:    db 'DeleteFileW',0
