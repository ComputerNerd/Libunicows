%include "dll_names.inc"

                    global __imp__SHFileOperationW@4
                    global _SHFileOperationW@4
                    global _Unicows_SHFileOperationW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SHFileOperationW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SHFileOperationW@4     ; place to save the pointer
                    push dword [_Unicows_SHFileOperationW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_SHFileOperationW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SHFileOperationW@4]

_SHFileOperationW@4:
                    jmp [__imp__SHFileOperationW@4]


                    section .data

__imp__SHFileOperationW@4:   dd unicows_initial_stub_SHFileOperationW
_Unicows_SHFileOperationW:      dd 0
namestring_SHFileOperationW:    db 'SHFileOperationW',0
