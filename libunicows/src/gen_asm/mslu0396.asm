%include "dll_names.inc"

                    global __imp__RemoveDirectoryW@4
                    global _RemoveDirectoryW@4
                    global _Unicows_RemoveDirectoryW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RemoveDirectoryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RemoveDirectoryW@4     ; place to save the pointer
                    push dword [_Unicows_RemoveDirectoryW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_RemoveDirectoryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RemoveDirectoryW@4]

_RemoveDirectoryW@4:
                    jmp [__imp__RemoveDirectoryW@4]


                    section .data

__imp__RemoveDirectoryW@4:   dd unicows_initial_stub_RemoveDirectoryW
_Unicows_RemoveDirectoryW:      dd 0
namestring_RemoveDirectoryW:    db 'RemoveDirectoryW',0
