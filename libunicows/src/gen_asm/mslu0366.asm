%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetPrivateProfileSectionNamesW@12
                    global GetPrivateProfileSectionNamesW
                    global _GetPrivateProfileSectionNamesW@12
                    global _Unicows_GetPrivateProfileSectionNamesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetPrivateProfileSectionNamesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrivateProfileSectionNamesW@12     ; place to save the pointer
                    push dword [_Unicows_GetPrivateProfileSectionNamesW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetPrivateProfileSectionNamesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetPrivateProfileSectionNamesW:
_GetPrivateProfileSectionNamesW@12:
                    jmp [__imp__GetPrivateProfileSectionNamesW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetPrivateProfileSectionNamesW@12:   dd unicows_initial_stub_GetPrivateProfileSectionNamesW
_Unicows_GetPrivateProfileSectionNamesW:      dd 0
namestring_GetPrivateProfileSectionNamesW:    db 'GetPrivateProfileSectionNamesW',0
