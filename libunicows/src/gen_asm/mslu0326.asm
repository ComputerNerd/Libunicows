%include "dll_names.inc"

                    global __imp__FindResourceW@12
                    global _FindResourceW@12
                    global _Unicows_FindResourceW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_FindResourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindResourceW@12     ; place to save the pointer
                    push dword [_Unicows_FindResourceW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_FindResourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__FindResourceW@12]

_FindResourceW@12:
                    jmp [__imp__FindResourceW@12]


                    section .data

__imp__FindResourceW@12:   dd unicows_initial_stub_FindResourceW
_Unicows_FindResourceW:      dd 0
namestring_FindResourceW:    db 'FindResourceW',0
