%include "dll_names.inc"

                    global __imp__GetDiskFreeSpaceW@20
                    global GetDiskFreeSpaceW
                    global _GetDiskFreeSpaceW@20
                    global _Unicows_GetDiskFreeSpaceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetDiskFreeSpaceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetDiskFreeSpaceW@20     ; place to save the pointer
                    push dword [_Unicows_GetDiskFreeSpaceW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetDiskFreeSpaceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetDiskFreeSpaceW:
_GetDiskFreeSpaceW@20:
                    jmp [__imp__GetDiskFreeSpaceW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetDiskFreeSpaceW@20:   dd unicows_initial_stub_GetDiskFreeSpaceW
_Unicows_GetDiskFreeSpaceW:      dd 0
namestring_GetDiskFreeSpaceW:    db 'GetDiskFreeSpaceW',0
