%include "dll_names.inc"

                    global __imp__GetDriveTypeW@4
                    global _GetDriveTypeW@4
                    global _Unicows_GetDriveTypeW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetDriveTypeW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetDriveTypeW@4     ; place to save the pointer
                    push dword [_Unicows_GetDriveTypeW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetDriveTypeW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetDriveTypeW@4]

_GetDriveTypeW@4:
                    jmp [__imp__GetDriveTypeW@4]


                    section .data

__imp__GetDriveTypeW@4:   dd unicows_initial_stub_GetDriveTypeW
_Unicows_GetDriveTypeW:      dd 0
namestring_GetDriveTypeW:    db 'GetDriveTypeW',0
