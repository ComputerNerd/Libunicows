%include "dll_names.inc"

                    global __imp__SetCurrentDirectoryW@4
                    global _SetCurrentDirectoryW@4
                    global _Unicows_SetCurrentDirectoryW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_SetCurrentDirectoryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetCurrentDirectoryW@4     ; place to save the pointer
                    push dword [_Unicows_SetCurrentDirectoryW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SetCurrentDirectoryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__SetCurrentDirectoryW@4]

_SetCurrentDirectoryW@4:
                    jmp [__imp__SetCurrentDirectoryW@4]


                    section .data

__imp__SetCurrentDirectoryW@4:   dd unicows_initial_stub_SetCurrentDirectoryW
_Unicows_SetCurrentDirectoryW:      dd 0
namestring_SetCurrentDirectoryW:    db 'SetCurrentDirectoryW',0
