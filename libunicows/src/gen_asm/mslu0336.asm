%include "dll_names.inc"

                    global __imp__GetDiskFreeSpaceExW@16
                    global _GetDiskFreeSpaceExW@16
                    global _Unicows_GetDiskFreeSpaceExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetDiskFreeSpaceExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetDiskFreeSpaceExW@16     ; place to save the pointer
                    push dword [_Unicows_GetDiskFreeSpaceExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetDiskFreeSpaceExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetDiskFreeSpaceExW@16]

_GetDiskFreeSpaceExW@16:
                    jmp [__imp__GetDiskFreeSpaceExW@16]


                    section .data

__imp__GetDiskFreeSpaceExW@16:   dd unicows_initial_stub_GetDiskFreeSpaceExW
_Unicows_GetDiskFreeSpaceExW:      dd 0
namestring_GetDiskFreeSpaceExW:    db 'GetDiskFreeSpaceExW',0
