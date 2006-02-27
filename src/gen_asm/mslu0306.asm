%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CopyFileExW@24
                    global CopyFileExW
                    global _CopyFileExW@24
                    global _Unicows_CopyFileExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CopyFileExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CopyFileExW@24     ; place to save the pointer
                    push dword [_Unicows_CopyFileExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CopyFileExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CopyFileExW:
_CopyFileExW@24:
                    jmp [__imp__CopyFileExW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CopyFileExW@24:   dd unicows_initial_stub_CopyFileExW
_Unicows_CopyFileExW:      dd 0
namestring_CopyFileExW:    db 'CopyFileExW',0
