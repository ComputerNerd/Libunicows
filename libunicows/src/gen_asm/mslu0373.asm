%include "dll_names.inc"

                    global __imp__GetWindowsDirectoryW@8
                    global _GetWindowsDirectoryW@8
                    global _Unicows_GetWindowsDirectoryW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetWindowsDirectoryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetWindowsDirectoryW@8     ; place to save the pointer
                    push dword [_Unicows_GetWindowsDirectoryW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetWindowsDirectoryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetWindowsDirectoryW@8]

_GetWindowsDirectoryW@8:
                    jmp [__imp__GetWindowsDirectoryW@8]


                    section .data

__imp__GetWindowsDirectoryW@8:   dd unicows_initial_stub_GetWindowsDirectoryW
_Unicows_GetWindowsDirectoryW:      dd 0
namestring_GetWindowsDirectoryW:    db 'GetWindowsDirectoryW',0
