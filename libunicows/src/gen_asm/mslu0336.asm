%include "dll_names.inc"

                    global __imp__GetCurrentDirectoryW@8
                    global GetCurrentDirectoryW
                    global _GetCurrentDirectoryW@8
                    global _Unicows_GetCurrentDirectoryW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetCurrentDirectoryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCurrentDirectoryW@8     ; place to save the pointer
                    push dword [_Unicows_GetCurrentDirectoryW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetCurrentDirectoryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetCurrentDirectoryW:
_GetCurrentDirectoryW@8:
                    jmp [__imp__GetCurrentDirectoryW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetCurrentDirectoryW@8:   dd unicows_initial_stub_GetCurrentDirectoryW
_Unicows_GetCurrentDirectoryW:      dd 0
namestring_GetCurrentDirectoryW:    db 'GetCurrentDirectoryW',0
