%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__SHGetFileInfoW@20
                    global SHGetFileInfoW
                    global _SHGetFileInfoW@20
                    global _Unicows_SHGetFileInfoW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SHGetFileInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SHGetFileInfoW@20     ; place to save the pointer
                    push dword [_Unicows_SHGetFileInfoW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_SHGetFileInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SHGetFileInfoW:
_SHGetFileInfoW@20:
                    jmp [__imp__SHGetFileInfoW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SHGetFileInfoW@20:   dd unicows_initial_stub_SHGetFileInfoW
_Unicows_SHGetFileInfoW:      dd 0
namestring_SHGetFileInfoW:    db 'SHGetFileInfoW',0
