%include "dll_names.inc"

                    global __imp__GetFileAttributesExW@12
                    global GetFileAttributesExW
                    global _GetFileAttributesExW@12
                    global _Unicows_GetFileAttributesExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetFileAttributesExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetFileAttributesExW@12     ; place to save the pointer
                    push dword [_Unicows_GetFileAttributesExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetFileAttributesExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetFileAttributesExW:
_GetFileAttributesExW@12:
                    jmp [__imp__GetFileAttributesExW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetFileAttributesExW@12:   dd unicows_initial_stub_GetFileAttributesExW
_Unicows_GetFileAttributesExW:      dd 0
namestring_GetFileAttributesExW:    db 'GetFileAttributesExW',0
