%include "dll_names.inc"

                    global __imp__GetSystemWindowsDirectoryW@8
                    global _GetSystemWindowsDirectoryW@8
                    global _Unicows_GetSystemWindowsDirectoryW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetSystemWindowsDirectoryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetSystemWindowsDirectoryW@8     ; place to save the pointer
                    push dword [_Unicows_GetSystemWindowsDirectoryW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetSystemWindowsDirectoryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetSystemWindowsDirectoryW@8]

_GetSystemWindowsDirectoryW@8:
                    jmp [__imp__GetSystemWindowsDirectoryW@8]


                    section .data

__imp__GetSystemWindowsDirectoryW@8:   dd unicows_initial_stub_GetSystemWindowsDirectoryW
_Unicows_GetSystemWindowsDirectoryW:      dd 0
namestring_GetSystemWindowsDirectoryW:    db 'GetSystemWindowsDirectoryW',0
