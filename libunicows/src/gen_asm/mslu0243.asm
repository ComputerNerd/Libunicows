%include "dll_names.inc"

                    global __imp__SHFileOperationW@4
                    global SHFileOperationW
                    global _SHFileOperationW@4
                    global _Unicows_SHFileOperationW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SHFileOperationW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SHFileOperationW@4     ; place to save the pointer
                    push dword [_Unicows_SHFileOperationW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_SHFileOperationW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SHFileOperationW:
_SHFileOperationW@4:
                    jmp [__imp__SHFileOperationW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SHFileOperationW@4:   dd unicows_initial_stub_SHFileOperationW
_Unicows_SHFileOperationW:      dd 0
namestring_SHFileOperationW:    db 'SHFileOperationW',0
