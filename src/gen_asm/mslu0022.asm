%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CopyMetaFileW@8
                    global CopyMetaFileW
                    global _CopyMetaFileW@8
                    global _Unicows_CopyMetaFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CopyMetaFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CopyMetaFileW@8     ; place to save the pointer
                    push dword [_Unicows_CopyMetaFileW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_CopyMetaFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CopyMetaFileW:
_CopyMetaFileW@8:
                    jmp [__imp__CopyMetaFileW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CopyMetaFileW@8:   dd unicows_initial_stub_CopyMetaFileW
_Unicows_CopyMetaFileW:      dd 0
namestring_CopyMetaFileW:    db 'CopyMetaFileW',0
