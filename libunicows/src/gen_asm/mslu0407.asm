%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RemoveDirectoryW@4
                    global RemoveDirectoryW
                    global _RemoveDirectoryW@4
                    global _Unicows_RemoveDirectoryW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RemoveDirectoryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RemoveDirectoryW@4     ; place to save the pointer
                    push dword [_Unicows_RemoveDirectoryW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_RemoveDirectoryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RemoveDirectoryW:
_RemoveDirectoryW@4:
                    jmp [__imp__RemoveDirectoryW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RemoveDirectoryW@4:   dd unicows_initial_stub_RemoveDirectoryW
_Unicows_RemoveDirectoryW:      dd 0
namestring_RemoveDirectoryW:    db 'RemoveDirectoryW',0
