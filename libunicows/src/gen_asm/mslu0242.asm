%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__SHBrowseForFolderW@4
                    global SHBrowseForFolderW
                    global _SHBrowseForFolderW@4
                    global _Unicows_SHBrowseForFolderW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SHBrowseForFolderW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SHBrowseForFolderW@4     ; place to save the pointer
                    push dword [_Unicows_SHBrowseForFolderW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_SHBrowseForFolderW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SHBrowseForFolderW:
_SHBrowseForFolderW@4:
                    jmp [__imp__SHBrowseForFolderW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SHBrowseForFolderW@4:   dd unicows_initial_stub_SHBrowseForFolderW
_Unicows_SHBrowseForFolderW:      dd 0
namestring_SHBrowseForFolderW:    db 'SHBrowseForFolderW',0
