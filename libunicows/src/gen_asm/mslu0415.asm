%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WritePrivateProfileSectionW@12
                    global WritePrivateProfileSectionW
                    global _WritePrivateProfileSectionW@12
                    global _Unicows_WritePrivateProfileSectionW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WritePrivateProfileSectionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WritePrivateProfileSectionW@12     ; place to save the pointer
                    push dword [_Unicows_WritePrivateProfileSectionW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WritePrivateProfileSectionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WritePrivateProfileSectionW:
_WritePrivateProfileSectionW@12:
                    jmp [__imp__WritePrivateProfileSectionW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WritePrivateProfileSectionW@12:   dd unicows_initial_stub_WritePrivateProfileSectionW
_Unicows_WritePrivateProfileSectionW:      dd 0
namestring_WritePrivateProfileSectionW:    db 'WritePrivateProfileSectionW',0
