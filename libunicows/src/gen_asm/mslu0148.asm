%include "dll_names.inc"

                    global __imp__FindWindowExW@16
                    global _FindWindowExW@16
                    global _Unicows_FindWindowExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_FindWindowExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindWindowExW@16     ; place to save the pointer
                    push dword [_Unicows_FindWindowExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_FindWindowExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__FindWindowExW@16]

_FindWindowExW@16:
                    jmp [__imp__FindWindowExW@16]


                    section .data

__imp__FindWindowExW@16:   dd unicows_initial_stub_FindWindowExW
_Unicows_FindWindowExW:      dd 0
namestring_FindWindowExW:    db 'FindWindowExW',0