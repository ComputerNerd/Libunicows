%include "dll_names.inc"

                    global __imp__SetFileAttributesW@8
                    global SetFileAttributesW
                    global _SetFileAttributesW@8
                    global _Unicows_SetFileAttributesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetFileAttributesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetFileAttributesW@8     ; place to save the pointer
                    push dword [_Unicows_SetFileAttributesW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SetFileAttributesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetFileAttributesW:
_SetFileAttributesW@8:
                    jmp [__imp__SetFileAttributesW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetFileAttributesW@8:   dd unicows_initial_stub_SetFileAttributesW
_Unicows_SetFileAttributesW:      dd 0
namestring_SetFileAttributesW:    db 'SetFileAttributesW',0
