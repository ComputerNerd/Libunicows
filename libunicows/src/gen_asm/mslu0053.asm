%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetTextFaceW@12
                    global GetTextFaceW
                    global _GetTextFaceW@12
                    global _Unicows_GetTextFaceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetTextFaceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTextFaceW@12     ; place to save the pointer
                    push dword [_Unicows_GetTextFaceW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetTextFaceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetTextFaceW:
_GetTextFaceW@12:
                    jmp [__imp__GetTextFaceW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetTextFaceW@12:   dd unicows_initial_stub_GetTextFaceW
_Unicows_GetTextFaceW:      dd 0
namestring_GetTextFaceW:    db 'GetTextFaceW',0
