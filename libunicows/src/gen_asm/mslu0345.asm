%include "dll_names.inc"

                    global __imp__GetLogicalDriveStringsW@8
                    global _GetLogicalDriveStringsW@8
                    global _Unicows_GetLogicalDriveStringsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetLogicalDriveStringsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetLogicalDriveStringsW@8     ; place to save the pointer
                    push dword [_Unicows_GetLogicalDriveStringsW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetLogicalDriveStringsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetLogicalDriveStringsW@8]

_GetLogicalDriveStringsW@8:
                    jmp [__imp__GetLogicalDriveStringsW@8]


                    section .data

__imp__GetLogicalDriveStringsW@8:   dd unicows_initial_stub_GetLogicalDriveStringsW
_Unicows_GetLogicalDriveStringsW:      dd 0
namestring_GetLogicalDriveStringsW:    db 'GetLogicalDriveStringsW',0
