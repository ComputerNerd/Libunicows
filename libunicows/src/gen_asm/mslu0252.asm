%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetFileVersionInfoSizeW@8
                    global GetFileVersionInfoSizeW
                    global _GetFileVersionInfoSizeW@8
                    global _Unicows_GetFileVersionInfoSizeW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetFileVersionInfoSizeW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetFileVersionInfoSizeW@8     ; place to save the pointer
                    push dword [_Unicows_GetFileVersionInfoSizeW]      ; default proc, if any
                    push dword VERSION                  ; dll id
                    push dword namestring_GetFileVersionInfoSizeW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetFileVersionInfoSizeW:
_GetFileVersionInfoSizeW@8:
                    jmp [__imp__GetFileVersionInfoSizeW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetFileVersionInfoSizeW@8:   dd unicows_initial_stub_GetFileVersionInfoSizeW
_Unicows_GetFileVersionInfoSizeW:      dd 0
namestring_GetFileVersionInfoSizeW:    db 'GetFileVersionInfoSizeW',0
