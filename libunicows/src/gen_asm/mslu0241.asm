%include "dll_names.inc"

                    global __imp__SHBrowseForFolderW@4
                    global _SHBrowseForFolderW@4
                    global _Unicows_SHBrowseForFolderW
                  
                    extern _LoadUnicowsSymbol

                    section .text

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

                    ; ...and skip to it
                    jmp [__imp__SHBrowseForFolderW@4]

_SHBrowseForFolderW@4:
                    jmp [__imp__SHBrowseForFolderW@4]


                    section .data

__imp__SHBrowseForFolderW@4:   dd unicows_initial_stub_SHBrowseForFolderW
_Unicows_SHBrowseForFolderW:      dd 0
namestring_SHBrowseForFolderW:    db 'SHBrowseForFolderW',0
