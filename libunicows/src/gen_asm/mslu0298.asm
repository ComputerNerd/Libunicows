%include "dll_names.inc"

                    global __imp__CreateDirectoryExW@12
                    global _CreateDirectoryExW@12
                    global _Unicows_CreateDirectoryExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateDirectoryExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateDirectoryExW@12     ; place to save the pointer
                    push dword [_Unicows_CreateDirectoryExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateDirectoryExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateDirectoryExW@12]

_CreateDirectoryExW@12:
                    jmp [__imp__CreateDirectoryExW@12]


                    section .data

__imp__CreateDirectoryExW@12:   dd unicows_initial_stub_CreateDirectoryExW
_Unicows_CreateDirectoryExW:      dd 0
namestring_CreateDirectoryExW:    db 'CreateDirectoryExW',0
