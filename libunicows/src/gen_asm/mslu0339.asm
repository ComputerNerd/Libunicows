%include "dll_names.inc"

                    global __imp__GetDiskFreeSpaceExW@16
                    global GetDiskFreeSpaceExW
                    global _GetDiskFreeSpaceExW@16
                    global _Unicows_GetDiskFreeSpaceExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

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

                    ; ...and skip to it (see following jmp instruction):

GetDiskFreeSpaceExW:
_GetDiskFreeSpaceExW@16:
                    jmp [__imp__GetDiskFreeSpaceExW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetDiskFreeSpaceExW@16:   dd unicows_initial_stub_GetDiskFreeSpaceExW
_Unicows_GetDiskFreeSpaceExW:      dd 0
namestring_GetDiskFreeSpaceExW:    db 'GetDiskFreeSpaceExW',0
