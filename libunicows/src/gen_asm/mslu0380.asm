%include "dll_names.inc"

                    global __imp__LoadLibraryExW@12
                    global _LoadLibraryExW@12
                    global _Unicows_LoadLibraryExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_LoadLibraryExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadLibraryExW@12     ; place to save the pointer
                    push dword [_Unicows_LoadLibraryExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_LoadLibraryExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__LoadLibraryExW@12]

_LoadLibraryExW@12:
                    jmp [__imp__LoadLibraryExW@12]


                    section .data

__imp__LoadLibraryExW@12:   dd unicows_initial_stub_LoadLibraryExW
_Unicows_LoadLibraryExW:      dd 0
namestring_LoadLibraryExW:    db 'LoadLibraryExW',0
