%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetEnhMetaFileW@4
                    global GetEnhMetaFileW
                    global _GetEnhMetaFileW@4
                    global _Unicows_GetEnhMetaFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetEnhMetaFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetEnhMetaFileW@4     ; place to save the pointer
                    push dword [_Unicows_GetEnhMetaFileW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetEnhMetaFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetEnhMetaFileW:
_GetEnhMetaFileW@4:
                    jmp [__imp__GetEnhMetaFileW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetEnhMetaFileW@4:   dd unicows_initial_stub_GetEnhMetaFileW
_Unicows_GetEnhMetaFileW:      dd 0
namestring_GetEnhMetaFileW:    db 'GetEnhMetaFileW',0
