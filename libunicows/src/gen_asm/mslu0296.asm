%include "dll_names.inc"

                    global __imp__CreateDirectoryW@8
                    global _CreateDirectoryW@8
                    global _Unicows_CreateDirectoryW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_CreateDirectoryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateDirectoryW@8     ; place to save the pointer
                    push dword [_Unicows_CreateDirectoryW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CreateDirectoryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__CreateDirectoryW@8]

_CreateDirectoryW@8:
                    jmp [__imp__CreateDirectoryW@8]


                    section .data

__imp__CreateDirectoryW@8:   dd unicows_initial_stub_CreateDirectoryW
_Unicows_CreateDirectoryW:      dd 0
namestring_CreateDirectoryW:    db 'CreateDirectoryW',0
