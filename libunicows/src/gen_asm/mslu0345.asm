%include "dll_names.inc"

                    global __imp__GetFileAttributesW@4
                    global GetFileAttributesW
                    global _GetFileAttributesW@4
                    global _Unicows_GetFileAttributesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetFileAttributesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetFileAttributesW@4     ; place to save the pointer
                    push dword [_Unicows_GetFileAttributesW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetFileAttributesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetFileAttributesW:
_GetFileAttributesW@4:
                    jmp [__imp__GetFileAttributesW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetFileAttributesW@4:   dd unicows_initial_stub_GetFileAttributesW
_Unicows_GetFileAttributesW:      dd 0
namestring_GetFileAttributesW:    db 'GetFileAttributesW',0
