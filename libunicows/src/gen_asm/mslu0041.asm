%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetEnhMetaFileDescriptionW@12
                    global GetEnhMetaFileDescriptionW
                    global _GetEnhMetaFileDescriptionW@12
                    global _Unicows_GetEnhMetaFileDescriptionW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetEnhMetaFileDescriptionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetEnhMetaFileDescriptionW@12     ; place to save the pointer
                    push dword [_Unicows_GetEnhMetaFileDescriptionW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetEnhMetaFileDescriptionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetEnhMetaFileDescriptionW:
_GetEnhMetaFileDescriptionW@12:
                    jmp [__imp__GetEnhMetaFileDescriptionW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetEnhMetaFileDescriptionW@12:   dd unicows_initial_stub_GetEnhMetaFileDescriptionW
_Unicows_GetEnhMetaFileDescriptionW:      dd 0
namestring_GetEnhMetaFileDescriptionW:    db 'GetEnhMetaFileDescriptionW',0
