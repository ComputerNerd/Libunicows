%include "dll_names.inc"

                    global __imp__FindResourceExW@16
                    global _FindResourceExW@16
                    global _Unicows_FindResourceExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_FindResourceExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindResourceExW@16     ; place to save the pointer
                    push dword [_Unicows_FindResourceExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_FindResourceExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__FindResourceExW@16]

_FindResourceExW@16:
                    jmp [__imp__FindResourceExW@16]


                    section .data

__imp__FindResourceExW@16:   dd unicows_initial_stub_FindResourceExW
_Unicows_FindResourceExW:      dd 0
namestring_FindResourceExW:    db 'FindResourceExW',0
