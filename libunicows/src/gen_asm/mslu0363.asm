%include "dll_names.inc"

                    global __imp__GetSystemDirectoryW@8
                    global _GetSystemDirectoryW@8
                    global _Unicows_GetSystemDirectoryW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetSystemDirectoryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetSystemDirectoryW@8     ; place to save the pointer
                    push dword [_Unicows_GetSystemDirectoryW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetSystemDirectoryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetSystemDirectoryW@8]

_GetSystemDirectoryW@8:
                    jmp [__imp__GetSystemDirectoryW@8]


                    section .data

__imp__GetSystemDirectoryW@8:   dd unicows_initial_stub_GetSystemDirectoryW
_Unicows_GetSystemDirectoryW:      dd 0
namestring_GetSystemDirectoryW:    db 'GetSystemDirectoryW',0
