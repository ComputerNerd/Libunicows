%include "dll_names.inc"

                    global __imp__CopyFileW@12
                    global CopyFileW
                    global _CopyFileW@12
                    global _Unicows_CopyFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CopyFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CopyFileW@12     ; place to save the pointer
                    push dword [_Unicows_CopyFileW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CopyFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CopyFileW:
_CopyFileW@12:
                    jmp [__imp__CopyFileW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CopyFileW@12:   dd unicows_initial_stub_CopyFileW
_Unicows_CopyFileW:      dd 0
namestring_CopyFileW:    db 'CopyFileW',0
