%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetCharABCWidthsFloatW@16
                    global GetCharABCWidthsFloatW
                    global _GetCharABCWidthsFloatW@16
                    global _Unicows_GetCharABCWidthsFloatW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetCharABCWidthsFloatW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCharABCWidthsFloatW@16     ; place to save the pointer
                    push dword [_Unicows_GetCharABCWidthsFloatW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetCharABCWidthsFloatW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetCharABCWidthsFloatW:
_GetCharABCWidthsFloatW@16:
                    jmp [__imp__GetCharABCWidthsFloatW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetCharABCWidthsFloatW@16:   dd unicows_initial_stub_GetCharABCWidthsFloatW
_Unicows_GetCharABCWidthsFloatW:      dd 0
namestring_GetCharABCWidthsFloatW:    db 'GetCharABCWidthsFloatW',0
