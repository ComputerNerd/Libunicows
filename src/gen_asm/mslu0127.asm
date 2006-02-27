%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__DdeQueryConvInfo@12
                    global DdeQueryConvInfo
                    global _DdeQueryConvInfo@12
                    global _Unicows_DdeQueryConvInfo
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DdeQueryConvInfo:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DdeQueryConvInfo@12     ; place to save the pointer
                    push dword [_Unicows_DdeQueryConvInfo]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DdeQueryConvInfo      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DdeQueryConvInfo:
_DdeQueryConvInfo@12:
                    jmp [__imp__DdeQueryConvInfo@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DdeQueryConvInfo@12:   dd unicows_initial_stub_DdeQueryConvInfo
_Unicows_DdeQueryConvInfo:      dd 0
namestring_DdeQueryConvInfo:    db 'DdeQueryConvInfo',0
