%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__DeleteFileW@4
                    global DeleteFileW
                    global _DeleteFileW@4
                    global _Unicows_DeleteFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DeleteFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DeleteFileW@4     ; place to save the pointer
                    push dword [_Unicows_DeleteFileW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_DeleteFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DeleteFileW:
_DeleteFileW@4:
                    jmp [__imp__DeleteFileW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DeleteFileW@4:   dd unicows_initial_stub_DeleteFileW
_Unicows_DeleteFileW:      dd 0
namestring_DeleteFileW:    db 'DeleteFileW',0
